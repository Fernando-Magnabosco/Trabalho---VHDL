module reg_8b_in_16b_out(
    
    input [7:0] X,
    input [0:0] clk, LX,
    output reg [15:0] C

);

    always @ (posedge clk & LX) begin

        C <= X;

    end

endmodule

module reg_16b_in_16b_out(
    
    input [15:0] X,
    input [0:0] clk, LX,
    output reg [15:0] C

);

    always @ (posedge clk & LX) begin

        C <= X;

    end

endmodule

