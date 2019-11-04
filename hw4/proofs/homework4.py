from AST import (Pred, Forall, Exists, Var, true, false, And, Or, Not, Arrow)
from Parser import parse
from Exceptions import (ProofException, SubException, ParseException, LexException)
from Proof import (clear, step, premise, andI, andEL, andER, \
                   orIL, orIR, orE, assume, assumed, arrowI, arrowE, \
                   notI, notE, TI, FE, LEM, \
                   forallI, forallE, existsI, existsE)


# FA x. FA y. P(x,y) |-  FA y. FA x. P(x,y)
def forall_comm():
    return forallI(
             assume(Var("c")),
             forallI(
               assume(Var("d")),
               forallE(
                 forallE(
                   premise(parse("FA x. FA y. P(x, y)")),
                   "d",
                   parse("FA y. P(d, y)"),
                   ),
                 "c",
                 parse("P(d, c)"),
                 ),
               parse("FA x. P(x, c)")
               ),
            parse("FA y. FA x. P(x, y)")
            )

#FA x. ~P(x) |- ~EX x. P(x)
def DM1():
    return notI(
            arrowI(
              assume(parse("EX x. P(x)")),
              notE(
                existsE(
                  assumed(parse("EX x. P(x)")),
                  "d",
                  arrowI(
                    assume(parse("P(d)")),
                    FE(
                      notE(
                        assumed(parse("P(d)")),
                        forallE(
                          premise(parse("FA x. ~P(x)")),
                          "d",
                          parse("~P(d)")
                          ),
                        false()
                        ),
                      parse("P(c)")
                      ),
                    parse("P(d) -> P(c)")
                    ),
                  parse("P(c)")
                  ),
                forallE(
                  premise(parse("FA x. ~P(x)")),
                  "c",
                  parse("~P(c)")
                  ),
                false()
                ),
              Arrow(parse("EX x. P(x)"), false())
              ),
            parse("~EX x. P(x)")
            )

#EX x. ~P(x) |- ~FA x. P(x)
def DM2():
    return notI(
            arrowI(
              assume(parse("FA x. P(x)")),
              notE(
                forallE(
                  assumed(parse("FA x. P(x)")),
                  "c",
                  parse("P(c)")
                  ),
                existsE(
                  premise(parse("EX x. ~P(x)")),
                  "d",
                  arrowI(
                    assume(parse("~P(d)")),
                    FE(
                      notE(
                        forallE(
                          assumed(parse("FA x. P(x)")),
                          "d",
                          parse("P(d)")
                          ),
                        assumed(parse("~P(d)")),
                        false()
                        ),
                      parse("~P(c)")
                      ),
                    parse("~P(d) -> ~P(c)")
                    ),
                  parse("~P(c)")
                  ),
                false()
                ),
              Arrow(parse("FA x. P(x)"), false())
              ),
            parse("~FA x. P(x)")
            )

#~ EX x. P(x) |- FA x. ~P(x)
def DM3():
    return forallI(
            assume(Var("c")),
            notI(
              arrowI(
                assume(parse("P(c)")),
                notE(
                  existsI(
                    assumed(parse("P(c)")),
                    "c",
                    parse("EX x.P(x)")
                    ),
                  premise(parse("~EX x. P(x)")),
                  false()
                  ),
                Arrow(parse("P(c)"), false())
                ),
              parse("~P(c)")
              ),
            parse("FA x. ~P(x)")
            )

#FA x. P(x) -> Q |- (EX x. P(x)) -> Q$
def contra():
    return arrowI(
            assume(parse("EX x.P(x)")),
            existsE(
              assumed(parse("EX x.P(x)")),
              "c",
              forallE(
                premise(parse("FA x.P(x) -> Q")),
                "c",
                parse("P(c) -> Q")
                ),
              parse("Q")
              ),
            parse("(EX x.P(x)) -> Q")
            )

def main():
    try:
        clear()
        forall_comm().print_proof()
        clear()
        DM1().print_proof()
        clear()
        DM2().print_proof()
        clear()
        DM3().print_proof()
        clear()
        contra().print_proof()

    except (ParseException, LexException) as e:
        print(str(e))
    except (ProofException) as e:
        e.print()
    except Exception as e:
        print(e)

if __name__ == "__main__":
    main()
