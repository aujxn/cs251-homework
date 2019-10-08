
from sys import argv
from AST import (truth_table, Var, true, false, And, Or, Not, Arrow)
from Parser import parse
from Exceptions import (ProofException, EvalException, ParseException, LexException)
from Proof import (clear, step, premise, andI, andEL, andER, \
                   orIL, orIR, orE, assume, assumed, arrowI, arrowE, \
                   notI, notE, TI, FE, LEM)


#a ∨  b |- b ∨  a
def orComm():
    return None

#a ∨ b, ¬ b |- a
def disSyl():
    return None

#¬ a ∨  ¬ b |- ¬ (a ∧ b)
def DM1():
    return None

#DL1: ¬(¬ a ∨  ¬ b) |- a
def DL1():
    return None

#DL2: ¬(¬ a ∨  ¬ b) |- a
def DL2():
    return None

#¬(a ∧ b) |- ¬ a ∨  ¬ b
def DM2():
    return None

def main():
    try:
        DM2().print_proof()
        DL2().print_proof()
        DL1().print_proof()
        DM1().print_proof()
        disSyl().print_proof()
        orComm().print_proof()
    except (ProofException) as e:
        e.print()

