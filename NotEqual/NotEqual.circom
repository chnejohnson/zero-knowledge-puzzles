pragma circom 2.1.4;


// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION
include "../node_modules/circomlib/circuits/comparators.circom";

template NotEqual() {
    signal input a[2];
    signal output c;
    
    component eq = IsEqual(); // eq.out is 1 if a[0] == a[1] , 0 otherwise.
    eq.in[0] <== a[0];
    eq.in[1] <== a[1];

    component isz = IsZero(); // isz.out is 1 if eq.out is 0 , 0 otherwise.
    isz.in <== eq.out;

    // c is 1 if isz.out is 1 , 0 otherwise.
    c <== isz.out;
}

component main = NotEqual();