module reg_8b_in_16b_out( // Registrador conversor com input de 8 bits e saída de 16 bits; 
    
    input [7:0] X,
    input [0:0] clk, LX,
    output reg [15:0] C

);
  
    always @ (posedge clk & LX) begin

        C <= X;
        C[8] <= X[7];
        C[9] <= X[7];
        C[10] <= X[7];
        C[11] <= X[7];
        C[12] <= X[7];
        C[13] <= X[7];
        C[14] <= X[7];
        C[15] <= X[7];

    end

endmodule

module reg_16b_in_16b_out( // Registrador com IO's de 16 bits;
    
    input [15:0] X,
    input [0:0] clk, LX,
    output reg [15:0] C

);

    always @ (posedge clk & LX) begin

        C <= X;

    end

endmodule

