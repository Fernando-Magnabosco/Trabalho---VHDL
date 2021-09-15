`include "mux.v"

module multiplica(

    input [15:0] A,B,
    output [15:0] C

);

    wire [15:0] D,E,F,G;
    wire [0:0] H;
    absolute a1(A,D);
    absolute a2(B,E);
    assign F = E*D;
    xor x(H,A[15],B[15]);
    multiply_minus_one c1(F,G);
    mux2x1_16b mux1(F,G,H,C);

endmodule


module multiply_minus_one(    

    input [15:0] A,
    output [15:0] B

);

    wire [0:0] of;
    wire [15:0] C;
    not_16b not0(A,C);
    SOMA soma1(C,16'b0000000000000001,B,of);

endmodule

module absolute(    

    input [15:0] A,
    output [15:0] B

);

    wire [0:0] of;
    wire [15:0] C,D;
    SOMA soma1(A,16'b1111111111111111,C,of);
    not_16b not0(C,D);
    mux2x1_16b mux1 (A,D,A[15],B);

endmodule


module not_16b(    

    input [15:0] A,
    output [15:0] B

);

    not not0(B[0],A[0]);
    not not1(B[1],A[1]);
    not not2(B[2],A[2]);
    not not3(B[3],A[3]);
    not not4(B[4],A[4]);
    not not5(B[5],A[5]);
    not not6(B[6],A[6]);
    not not7(B[7],A[7]);
    not not8(B[8],A[8]);
    not not9(B[9],A[9]);
    not not10(B[10],A[10]);
    not not11(B[11],A[11]);
    not not12(B[12],A[12]);
    not not13(B[13],A[13]);
    not not14(B[14],A[14]);
    not not15(B[15],A[15]);

endmodule
