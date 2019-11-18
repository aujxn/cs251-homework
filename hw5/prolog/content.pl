:-op(200, fx, [~]).
:-op(300, xfx, [/\]).
:-op(400, xfx, [\/]).
:-op(500, xfx, [->]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helper predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ancestor with number
ancestor(Child,Child,0).
ancestor(Ancestor,Child,Gen) :-
   parent(Parent,Child), 
   ancestor(Ancestor,Parent,ParentGen), 
   Gen is ParentGen+1.

% ancestor with list
ancestors(Child,Child,[]).
ancestors(Ancestor,Child,[Parent|Ancestors]) :-
   parent(Parent,Child), 
   ancestors(Ancestor,Parent,Ancestors).


sibling(X,Y) :-
   parent(Parent,X), 
   parent(Parent,Y), 
   X \= Y.

cousin(X,Y) :-
   parent(ParentX,X), 
   parent(ParentY,Y), 
   sibling(ParentX, ParentY), 
   ParentX \= ParentY.

second_cousin(X,Y) :-
   parent(ParentX,X), 
   parent(ParentY,Y), 
   cousin(ParentX, ParentY), 
   ParentX \= ParentY.

removed(X,Y,N) :-
   ancestor(Ancestor,X,G1), 
   ancestor(Ancestor,Y,G2), 
   N is G1 - G2.

% The _ means it's a free variable, but we don't care about the value.
% This surpresses a warning.
alabama(X,Y,AncestorX,AncestorY) :-
   married(X,Y), 
   ancestor(AncestorX,X,_), 
   ancestor(AncestorY,Y,_), 
   married(AncestorX,AncestorY),
   X \= AncestorX,
   Y \= AncestorY.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

concat([], B, B).
concat([H|T], B, [H|C]) :-
   concat(T, B, C).

insert(X, T, XT) :-
   concat(A, B, T),
   concat(A, [X|B], XT).

permute([], []).
permute([H|T], P) :-
   permute(T, PT),
   insert(H, PT, P).

len([], 0).
len([_|T], N) :-
   len(T,M), N is M+1.

% This doesn't work without defining sorted.
permsort(X, Y) :-
   permute(X, Y), sorted(Y).

add_col([], [], []).
add_col([C|CS], [], [[C]|CRS]) :-
   add_col(CS, [], CRS).
add_col([C|CS], [R|RS], [[C|R]|CRS]) :-
   add_col(CS, RS, CRS).

transpose([], []).
transpose([Row|Rows], Trans) :- 
   transpose(Rows, TransRows), 
   add_col(Row, TransRows, Trans). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% graph theory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% v1   v2    v3
%  \  /  \  /
%   v4    v5
%    |    |
%   v6 -- v7 -- v8
%    |    |
%   v9   v10 -- v11

vertices([v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11]).
edge(v1,v4).
edge(v2,v4).
edge(v2,v5).
edge(v3,v5).
edge(v4,v6).
edge(v5,v7).
edge(v6,v7).
edge(v6,v9).
edge(v7,v8).
edge(v7,v10).
edge(v10,v11).

pair(V1, V2) :-
   vertices(VS),
   member(V1, VS),
   member(V2, VS).

und_edge(X,Y) :-
   edge(X,Y).
und_edge(X,Y) :-
   edge(Y,X).

neighborhood(v, N) :-
   findall(X, und_edge(X,v), N).
degree(v, D) :-
   neighborhood(v, N), len(N,D).

edges(E) :-
   findall([V1,V2], edge(V1,V2), E).

partition([], [], []).
partition([H|L], [H|S], T) :-
   partition(L,S,T).
partition([H|L], S, [H|T]) :-
   partition(L,S,T).

crosses(V1, V2, S, T) :-
   member(V1, S), member(V2,T).
crosses(V1, V2, S, T) :-
   member(V2, S), member(V1,T).

bipartite(S,T) :-
   vertices(V),
   partition(V,S,T),
   edges(Edges),
   all_cross(Edges, S, T).

all_cross([], _, _).
all_cross([[V1,V2]|Edges], S, T) :- 
   crosses(V1,V2,S,T), 
   all_cross(Edges, S, T).

path(X, X, [X],   _).
path(X, Y, [X|P], Seen) :-
   und_edge(X,V),
   not(member(V, Seen)),
   path(V, Y, P, [X|Seen]).

partition_list([], []).
partition_list([H|T], [[H|Y]|P]) :-
   partition(T, Y, Z),
   partition_list(Z, P).

color(Colors) :- 
   vertices(V),
   partition_list(V, Colors),
   not(color_conflict(Colors)).

color_conflict(Colors) :- 
   member(Color, Colors),
   member(V1,Color),
   member(V2,Color),
   edge(V1,V2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% translation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% here's the kana table we saw in class
%   | a  i  u  e  k
%---+---------------
% a | あ い う え お
% k | か き く け こ
% g | が ぎ ぐ げ ご
% s | さ し す せ そ
% z | ざ じ ず ぜ ぞ
% t | た ち つ て と
% d | だ ぢ づ で ど
% n | な に ぬ ね の
% m | ま み む め も
% r | ら り る れ ろ
% h | は ひ ふ へ ほ
% b | ば び ぶ べ ぼ
% p | ぱ ぴ ぷ ぺ ぽ
% y | や    ゆ    よ
% w | わ          を
% n | ん

kana(a , あ). kana( i,  い). kana( u,  う). kana( e, え). kana( o, お).
kana(ka, か). kana(ki,  き). kana(ku,  く). kana(ke, え). kana(ko, こ).
kana(ga, が). kana(gi,  ぎ). kana(gu,  ぐ). kana(ge, げ). kana(go, ご).
kana(sa, さ). kana(si,  し). kana(su,  す). kana(se, せ). kana(so, そ).
kana(za, ざ). kana(zi,  じ). kana(zu,  ず). kana(ze, ぜ). kana(zo, ぞ).
kana(ta, た). kana(ti,  ち). kana(tu,  つ). kana(te, て). kana(to, と).
kana(da, だ). kana(di,  ぢ). kana(du,  づ). kana(de, で). kana(do, ど).
kana(na, な). kana(ni,  に). kana(nu,  ぬ). kana(ne, ね). kana(no, の).
kana(ma, ま). kana(mi,  み). kana(mu,  む). kana(me, め). kana(mo, も).
kana(ra, ら). kana(ri,  り). kana(ru,  る). kana(re, れ). kana(ro, ろ).
kana(ha, は). kana(hi,  ひ). kana(hu,  ふ). kana(he, へ). kana(ho, ほ).
kana(ba, ば). kana(bi,  び). kana(bu,  ぶ). kana(be, べ). kana(bo, ぼ).
kana(pa, ぱ). kana(pi,  ぴ). kana(pu,  ぷ). kana(pe, ぺ). kana(po, ぽ).
kana(ya, や).                kana(yu,  ゆ).               kana(yo, よ).
kana(wa, わ).                                             kana(wo, を).
kana(n,  ん).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% boolean algebra
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(t).
set(f).

sat(t).

sat(A /\ B) :- 
   sat(A), sat(B).

sat(A \/ _) :- 
   sat(A).

sat(_ \/ B) :- 
   sat(B).

sat(A -> _) :- 
   not(sat(A)).

sat(A -> B) :- 
   sat(A), sat(B).

sat(~A) :- 
   not(sat(A)).
