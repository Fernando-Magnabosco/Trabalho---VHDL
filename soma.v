
module meio_somador (    

    input  [0:0] A, B,
    output [0:0] S, C

);
 
    assign S = A ^ B;
    assign C = A & B;
    
endmodule

module full_somador (    
    
    input  A, B, Cin,
    output Soma, Cout

);
 
    wire Carry_1, Carry_2, Soma_1; 
    
    meio_somador U1 (A, B, Soma_1, Carry_1);
    meio_somador U2 (Cin, Soma_1, Soma, Carry_2);

    or           U3 (Cout, Carry_1, Carry_2);
    endmodule

module SOMA(    

    input [15:0] A, B,
    output [15:0]C,
    output [0:0] overflow

); 

    wire [15:0] D;
    assign overflow = D[14] ^ D[15];


    full_somador S1(A[0],B[0],1'b0,C[0],D[0]);
    full_somador S2(A[1],B[1],D[0],C[1],D[1]);
    full_somador S3(A[2],B[2],D[1],C[2],D[2]);
    full_somador S4(A[3],B[3],D[2],C[3],D[3]);
    full_somador S5(A[4],B[4],D[3],C[4],D[4]);
    full_somador S6(A[5],B[5],D[4],C[5],D[5]);
    full_somador S7(A[6],B[6],D[5],C[6],D[6]);
    full_somador S8(A[7],B[7],D[6],C[7],D[7]);
    full_somador S9(A[8],B[8],D[7],C[8],D[8]);
    full_somador S10(A[9],B[9],D[8],C[9],D[9]);
    full_somador S11(A[10],B[10],D[9],C[10],D[10]);
    full_somador S12(A[11],B[11],D[10],C[11],D[11]);
    full_somador S13(A[12],B[12],D[11],C[12],D[12]);
    full_somador S14(A[13],B[13],D[12],C[13],D[13]);
    full_somador S15(A[14],B[14],D[13],C[14],D[14]);
    full_somador S16(A[15],B[15],D[14],C[15],D[15]);



endmodule