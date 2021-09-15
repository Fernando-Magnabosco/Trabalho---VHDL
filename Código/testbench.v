`include "BO.v"
`include "BC.v"


module testbench;

//CLK
reg clk = 0;
wire wire_clk;
assign wire_clk = clk;

// IN OUT BC;
reg [0:0] Start, Reset;
wire [0:0] LX,LS,LH,H,finished;
wire [1:0] M0,M1,M2;

// IN OUT BO0;
reg [7:0] X;
reg [15:0] A,B,C;
wire [0:0] Overflow;
wire [15:0] Resultado;

//
reg [0:0] auxOverflow;

//Blocos 

BC BC0(Start,Reset,wire_clk,LX,LS,LH,H,finished,M0,M1,M2);
BO BO0(X,A,B,C,clk,LX,LS,LH,H,M0,M1,M2, Overflow, Resultado);

always #1 begin
     
     clk <= ~clk;
     if (Overflow) begin
          
          auxOverflow <= 1'b1;

     end

end

always @(posedge finished) begin
     

     $display ("%d",$signed(Resultado));

     if (auxOverflow) begin
          
          $display ("Ocorreu um Overflow!");
          
     end

end

initial begin
     
     $dumpvars;

     Start = 1'b1;
     X <= 8'b11101100; A <= 16'b11; B <= 16'b100; C = 16'b101;
     #15;
     Reset = 1'b1;
     Start = 1'b0;
     #1;
     Reset = 1'b0;
     #1;
     X <= 8'b110; A <= 16'b100; B <= 16'b101; C = 16'b0111111111111111;
     Start = 1'b1;
     #15;
     $finish;

    
end
endmodule