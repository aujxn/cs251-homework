
from AST import (Pred, Forall, Exists, Var, true, false, And, Or, Not, Arrow)
from Parser import parse

def test():
    p1l = parse("P(x)")
    p1r = parse("P(y)")
    print(p1l, "[x |-> y] ==", p1r, p1l.sub("x","y") == p1r)
    p2l = parse("FA x. P(x)")
    p2r = parse("FA x. P(x)")
    print(p2l, "[x |-> y] ==", p2r, p2l.sub("x","y") == p2r)
    p3l = parse("FA x. P(x)")
    p3r = parse("FA x. P(x)")
    print(p3l, "[x |-> y] ==", p3r, p3l.sub("x","y") == p3r)
    p4l = parse("P(x,y) && FA y . Q(x,y) && FA x. R(x,y)")
    p4r = parse("P(z,y) && FA y . Q(z,y) && FA x. R(x,y)")
    print(p4l, "[x |-> z] ==", p4r, p4l.sub("x","z") == p4r)

if __name__ == "__main__":
    test()
