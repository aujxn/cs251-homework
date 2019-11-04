from AST import (Pred, Forall, Exists, Var, true, false, And, Or, Not, Arrow)
from Parser import parse
from Exceptions import (ProofException, SubException, ParseException, LexException)
from Proof import (clear, step, premise, andI, andEL, andER, \
                   orIL, orIR, orE, assume, assumed, arrowI, arrowE, \
                   notI, notE, TI, FE, LEM, \
                   forallI, forallE, existsI, existsE)


def ren_forall():
    return forallI(
             assume(Var("x")),
             forallE(
               premise(parse("FA x. P(x)")),
               "x",
               parse("P(x)"),
             ),
             parse("FA z. P(z)")
           )

def ren_exists():
    return existsE(
             premise(parse("EX x. P(x)")),
             "c",
             arrowI(
               assume(parse("P(c)")),
               existsI(
                 assumed(parse("P(c)")),
                 "c",
                 parse("EX z. P(z)")
               ),
               parse("P(c) -> EX z. P(z)")
             ),
             parse("EX z. P(z)")
           )

def exists_comm():
    return existsE(
             premise(parse("EX x. EX y. P(x,y)")),
             "c",
             arrowI(
               assume(parse("EX y. P(c,y)")),
               existsE(
                 assumed(parse("EX y. P(c,y)")),
                 "d",
                 arrowI(
                   assume(parse("P(c,d)")),
                   existsI(
                     existsI(
                       assumed(parse("P(c,d)")),
                       "c",
                       parse("EX x. P(x,d)")
                     ),
                     "d",
                     parse("EX y. EX x. P(x,y)")
                   ),
                   parse("P(c,d) -> EX y. EX x. P(x,y)")
                 ),
                 parse("EX y. EX x. P(x,y)")
               ),
               parse("(EX y. P(c,y)) -> EX y. EX x. P(x,y)")
             ),
             parse("EX y. EX x. P(x,y)")
           )


def main():
    try:
        clear()
        ren_forall().print_proof()
        clear()
        ren_exists().print_proof()
        clear()
        exists_comm().print_proof()
    except (ProofException) as e:
        e.print()

if __name__ == "__main__":
    main()
