pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";


/*
    Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

    "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
                                                                                   [0, 0, 1, 0]
                                                                                   [0, 0, 0, 3]
                                                                                   [2, 0, 0, 0]

    "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
                                                                                   [3, 2, 1, 4]
                                                                                   [4, 1, 2, 3]
                                                                                   [2, 3, 4, 1]

    "out" is the signal output of the circuit. "out" is 1 if the solution is correct, otherwise 0.                                                                               
*/


template Sudoku () {
    // Question Setup 
    signal input  question[16];
    signal input solution[16];
    signal output out;
    
    // Checking if the question is valid
    // question 如果直接寫在合約上，將它作為 public input，就不需要做這些檢查了，對吧？
    for(var v = 0; v < 16; v++){
        log(solution[v],question[v]);
        assert(question[v] == solution[v] || question[v] == 0);
    }
    
    var m = 0 ;
    component row1[4];
    for(var q = 0; q < 4; q++){
        row1[m] = IsEqual();
        row1[m].in[0]  <== question[q];
        row1[m].in[1] <== 0;
        m++;
    }
    3 === row1[3].out + row1[2].out + row1[1].out + row1[0].out;

    m = 0;
    component row2[4];
    for(var q = 4; q < 8; q++){
        row2[m] = IsEqual();
        row2[m].in[0]  <== question[q];
        row2[m].in[1] <== 0;
        m++;
    }
    3 === row2[3].out + row2[2].out + row2[1].out + row2[0].out; 

    m = 0;
    component row3[4];
    for(var q = 8; q < 12; q++){
        row3[m] = IsEqual();
        row3[m].in[0]  <== question[q];
        row3[m].in[1] <== 0;
        m++;
    }
    3 === row3[3].out + row3[2].out + row3[1].out + row3[0].out; 

    m = 0;
    component row4[4];
    for(var q = 12; q < 16; q++){
        row4[m] = IsEqual();
        row4[m].in[0]  <== question[q];
        row4[m].in[1] <== 0;
        m++;
    }
    3 === row4[3].out + row4[2].out + row4[1].out + row4[0].out; 

/*
    col1      col4
    [0,  1,  2,  3 ]    row1
    [4,  5,  6,  7 ]    row2
    [8,  9,  10, 11]    row3
    [12, 13, 14, 15]    row4
*/

    // Write your solution from here.. Good Luck!

    // source: https://github.com/teddav/zero-knowledge-puzzles/blob/main/Sudoku/Sudoku.circom
    // Problem: what if all the digits is unique but not 1, 2, 3, or 4? 
    // The circuit doesn't check this, right?

    var LEN = 4;
    
    signal valid_rows[LEN];
    signal valid_cols[LEN];

    // Check every row and column for unique digits

    for (var i = 0; i < LEN; i++) {
        var row[LEN] = [solution[LEN*i], solution[LEN*i+1], solution[LEN*i+2], solution[LEN*i+3]];
        var col[LEN] = [solution[i], solution[i+LEN], solution[i+LEN*2], solution[i+LEN*3]];
        valid_rows[i] <== UniqueDigits(LEN)(row);
        valid_cols[i] <== UniqueDigits(LEN)(col);
    }

    var valid_rows_and_cols = 0;
    // Check all 8 lines are valid
    for (var i = 0; i < LEN; i++) {
        valid_rows_and_cols += valid_rows[i];
        valid_rows_and_cols += valid_cols[i];
    }

    out <== IsEqual()([valid_rows_and_cols, 8]);
}

template NotEqual() {
    signal input in[2];
    signal tmp <== IsZero()(in[0] - in[1]);
    signal output out <== -1 * tmp + 1;
}

// Check if the row or the column has unique digits
template UniqueDigits(LEN) {
    signal input in[LEN];
    signal unique[LEN][LEN]; // [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]

    var total;

    for (var i = 0; i < LEN; i++) {
        for (var j = 0; j < LEN; j++) {
            if (i != j) {
                // i.e. row1: [1, 4], [1, 3], [1, 2], [4, 1], [4, 3], [4, 2], [3, 1], [3, 4], [3, 2], [2, 1], [2, 4], [2, 3
                unique[i][j] <== NotEqual()([in[i], in[j]]);
                total += unique[i][j];
            }
        }
    }

    var expected_total = LEN * LEN - LEN; // 4 * 4 - 4 = 12
    signal output out <== IsEqual()([total, expected_total]);
}

component main = Sudoku();

