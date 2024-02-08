pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

include "../node_modules/circomlib/circuits/comparators.circom";

template Equality() {
   // Your Code Here..
   signal input a[3];
   signal output c;

   component eq = IsEqual();
   eq.in[0] <== a[0];
   eq.in[1] <== a[1];

   component eq2 = IsEqual();
   eq2.in[0] <== a[1];
   eq2.in[1] <== a[2];

   c <== eq2.out;
}

component main = Equality();