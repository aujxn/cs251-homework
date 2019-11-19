%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CS 251: homework 5
% Name: Austen Nelson
% Due: 11/19/19
%
% The files homework5.pl, potter.pl, and content.pl
% are relavant
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Family trees
%
% Notices that I've included a few facts in poter.pl
% male/1 is true if the person is male
% female/1 is true if the person is female
% parent/2 was discused in class
% married/2 is true is the two people are married
% for married I needed to pick an order,
% so it's married(Husband, Wife).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% question 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write predicates 
% brother/2, sister/2, mother/2, father/2
% with the obvious meaning.
brother(Bro, Person) :-
   sibling(Bro, Person),
   male(bro).

sister(Sis, Person) :-
   sibling(Sis, Person),
   female(Sis).

mother(Mom, Person) :-
   parent(Mom, Person),
   female(Mom).

father(Dad, Person) :-
   parent(Dad, Person),
   male(Dad).

% question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicates
% brother_in_law/2 sister_in_law/2 mother_in_law/2 father_in_law/2
% Be careful to make sure you've covered all ways to get inlaws.

% case: 
%  bro_law is the sibling of person's spouse
%  person is female then they are second in married
brother_in_law(Bro_law, Person) :- 
   male(Bro_law),
   sibling(Bro_law, Bro_sib),
   married(Bro_sib, Person).

% case:
%  bro_law is the sibling of person's spouse
%  If person is male then they are first in married
brother_in_law(Bro_law, Person) :- 
   male(Bro_law),
   sibling(Bro_law, Bro_sib),
   married(Person, Bro_sib).

% case: 
%  person is sibling of bro_law's spouse
%  checking for male is redundant because first in married is husband
brother_in_law(Bro_law, Person) :- 
   male(Bro_law),
   married(Bro_law, Person_sib),
   sibling(Person, Person_sib).

% case:
%  Is your spouse's sibling's spouse an in law?
%  bro_law is spouse of person's spouse's sibling
%  person is female because second in married
brother_in_law(Bro_law, Person) :- 
   male(Bro_law),
   married(Bro_law, Bro_spouse),
   sibling(Bro_spouse, Person_spouse),
   married(Person_spouse, Person).

% case:
%  Is your spouse's sibling's spouse an in law?
%  bro_law is spouse of person's spouse's sibling
%  person is male because first in married
brother_in_law(Bro_law, Person) :- 
   male(Bro_law),
   married(Bro_law, Bro_spouse),
   sibling(Bro_spouse, Person_spouse),
   married(Person, Person_spouse).

% case: 
%  sis_law is the sibling of person's spouse
%  person is female then they are second in married
sister_in_law(Sis_law, Person) :- 
   female(Sis_law),
   sibling(Sis_law, Sis_sib),
   married(Sis_sib, Person).

% case:
%  sis_law is the sibling of person's spouse
%  If person is male then they are first in married
sister_in_law(Sis_law, Person) :- 
   female(Sis_law),
   sibling(Sis_law, Sis_sib),
   married(Person, Sis_sib).

% case: 
%  person is sibling of sis_law's spouse
%  checking for female is redundant because first in married is husband
sister_in_law(Sis_law, Person) :- 
   female(Sis_law),
   married(Person_sib, Sis_law),
   sibling(Person, Person_sib).

% case:
%  Is your spouse's sibling's spouse an in law?
%  sis_law is spouse of person's spouse's sibling
%  person is female because second in married
sister_in_law(Sis_law, Person) :- 
   female(Sis_law),
   married(Sis_spouse, Sis_law),
   sibling(Sis_spouse, Person_spouse),
   married(Person_spouse, Person).

% case:
%  Is your spouse's sibling's spouse an in law?
%  sis_law is spouse of person's spouse's sibling
%  person is male because first in married
sister_in_law(Sis_law, Person) :- 
   female(Sis_law),
   married(Sis_spouse, Sis_law),
   sibling(Sis_spouse, Person_spouse),
   married(Person, Person_spouse).

mother_in_law(Mom_law, Y) :- 
   mother(Mom_law, Y_sib),
   married(Y_sib, Y).

father_in_law(Dad_law, Y) :- 
   father(Dad_law, Y_sib),
   married(Y_sib, Y).

% question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write a predicate nth_cousin/3
% nth_cousin(X,Y,N) returns true if X and Y are Nth cousins.
% Your 0th cousin is your sibling.
% Your first cousin is your cousin.
% Your second cousin is the children of your parents cousin.
% Your third cousin is the children of your parents second cousin.
% and so on.
nth_cousin(X,Y,0) :- 
   sibling(X, Y).

nth_cousin(X, Y, N) :-
   parent(ParentX, X),
   parent(ParentY, Y),
   nth_cousin(ParentX, ParentY, New_n),
   N is New_n + 1.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write a predicate to reverse a list
reverse([], []).
reverse([H|T], RevX) :- 
   reverse(T, RevT),
   append(RevT, [H], RevX).

% question 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write a predicate to determine if a list is a panindrome.
% a palindrome is a list where
% the first element is the same as the last
% the second element is the same as the second to last
% and so on.
% example: racecar
%          1234321
palindrome(X) :- 
   reverse(X, X).

% question 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write a predicate sublist/2
% sublist(S,L) should be true if the list S is contained in L
% for example sublist([3,4], [1,2,3,4,5,6]) should be true.
sublist(S, L) :-
   S = L.
sublist(S, [_|T]) :-
   sublist(S, T).

% question 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write the sorted/1 predicate from class
% sorted(L) should be true if L is a sorted list.
sorted([_|[]]).
sorted([H1, H2|T]) :- 
   H1 > H2,
   sorted([H2|T]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% question 8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write a predicate to determine if a graph has a cycle
% a graph has a cycle if there's a path from a vertex to itself.
% The edges are defined by the predicate
% edge(v1,v2).

% This solution uses the vertices predicate to determine
% if the graph has a cycle. It returns true a bunch but it works.
cycle() :- 
   pair(X, Y),
   path(X, Y, P1, []),
   path(Y, X, P2, []),
   reverse(P1, RevP1),
   RevP1 \= P2.

% This solution finds all the cycles in the graph or determines
% if a list of vertices makes a cycle. Cycles that contain the same
% vertices are different cycles for each starting vertex.
cycle2([Start|Path]) :-
   vertices(V),
   member(Start, V),
   und_edge(Start, Neighbor),
   path(Neighbor, Start, Path, []),
   Path \= [Neighbor, Start].

% This is the predicate to translate a string to hiragana
% toKana(hazimemasite, はじめまして).
toKana(Str,KanaStr) :- 
   atom_chars(Str,Chrs),
   toKanaList(Chrs,KanaChrs),
   atom_chars(KanaStr,KanaChrs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% translation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modify the kana table to account for these extra rules.
% し is actually shi instead of si
% じ is actually ji  instead of zi
% ち is actually chi instead of ti
% ぢ is actually ji  instead of di
% つ is actually tsu instead of tu
% づ is actually zu  instead of do
% ふ is actually fu  instead of hu
%

% question 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rewrite the toKanaList/2 predicate
% so that it works with kana characters of any length
% so it should work with n, so, shi, and any others.
% try to do this all with 2 two rules.
% the empty rule, and a rule of every other case.

toKanaList([], []).
toKanaList(CharsList, [KanaChar|KanaList]) :-
   split(CharsList, Chars1List, Chars2List),
   atom_chars(CharsAtom, Chars1List),
   kana(CharsAtom, KanaChar),
   toKanaList(Chars2List, KanaList).
