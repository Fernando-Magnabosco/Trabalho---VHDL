`include "BO.v"
`include "BC.v"


module testbench;

//CLK
reg clk = 0;
wire wire_clk;
assign wire_clk = clk;

// IN OUT BC;
reg [0:0] Start, Reset;
wire [0:0] LX,LS,LH,SEL_ULA,finished;
wire [1:0] M0,M1,M2;

// IN OUT BO0;
reg [7:0] X;
reg [15:0] A,B,C;
wire [0:0] Overflow;
wire [15:0] Resultado;

//Blocos 

BC BC0(Start,Reset,wire_clk,LX,LS,LH,SEL_ULA,finished,M0,M1,M2);
BO BO0(X,A,B,C,clk,LX,LS,LH,SEL_ULA,M0,M1,M2, Overflow, Resultado);

always #1 begin
     
     clk <= ~clk;

end

initial begin
     
     $dumpvars;

     Start = 1'b1;
     X <= 8'b10; A <= 16'b11; B <= 16'b100; C = 16'b101;
     #15;
     $finish;

    
end
endmodule