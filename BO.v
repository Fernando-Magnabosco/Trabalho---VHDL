`include "regs.v"
`include "ula.v"

module BO(

    input [7:0] X,
    input [15:0] A,B,C,
    input [0:0] clk,
    input [0:0] LX,LS,LH,SEL_ULA,
    input [1:0] M0,M1,M2,
    output [0:0] Overflow,
    output [15:0] Resultado

);

    wire [15:0] R0_OUT,RS_OUT,RH_OUT,
                M0_OUT,M1_OUT,M2_OUT,
                U_OUT;

    wire [0:0] OF; 

    assign Resultado = RS_OUT;
    assign Overflow = OF;

    ULA u0(M2_OUT,M1_OUT,SEL_ULA,U_OUT,OF);

    reg_8b_in_16b_out reg0(X,clk,LX,R0_OUT);
    reg_16b_in_16b_out regS(U_OUT,clk,LS,RS_OUT);
    reg_16b_in_16b_out regH(U_OUT,clk,LH,RH_OUT);

    mux4x1_16b mux0(16'b0,A,B,C,M0,M0_OUT);
    mux4x1_16b mux1(M0_OUT,R0_OUT,RS_OUT,RH_OUT,M1,M1_OUT);
    mux4x1_16b mux2(R0_OUT,M0_OUT,RS_OUT,RH_OUT,M2,M2_OUT);

endmodule