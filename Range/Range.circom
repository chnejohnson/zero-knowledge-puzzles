pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

include "../node_modules/circomlib/circuits/comparators.circom";

template Range() {
    signal input a;
    signal input lowerbound;
    signal input upperbound;

    signal output out;

    signal le;
    signal ge;

    le <== LessEqThan(252)([a, upperbound]);
    ge <== GreaterEqThan(252)([a, lowerbound]);

    out <== le * ge;
}

component main  = Range();


// 特殊解法 https://github.com/tarassh/zero-knowledge-puzzles/blob/main/Range/Range.circom

