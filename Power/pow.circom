pragma circom 2.1.4;

// Create a circuit which takes an input 'a',(array of length 2 ) , then  implement power modulo 
// and return it using output 'c'.

// HINT: Non Quadratic constraints are not allowed. 


// 題目「不」是要取 $\Sigma_{i=0}^{a[1]} a[0]^i$
// 指數為 a[1] 是一個 signal input，因此需要用 IsEqual 來確認目前的指數是否等於 a[1]


include "../node_modules/circomlib/circuits/comparators.circom";

template Pow(k) {
   signal input a[2];
   signal output c;

   signal equal[k];
   signal power[k];
   signal res[k];

   equal[0] <== 0;
   power[0] <== 1;
   res[0] <== IsZero()(a[1]);

   for (var i = 1; i < k; i++) {
      equal[i] <== IsEqual()([i, a[1]]);      
      power[i] <== power[i - 1] * a[0];
      res[i] <== res[i-1] + power[i] * equal[i];
   }

   c <== res[k-1];
}

component main = Pow(10);

