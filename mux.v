module mux2x1_16b(A,B,SEL,D);

    input [15:0]A,B;
    input [0:0] SEL;

    output reg[15:0] D;

    always @ (A or B or SEL) begin

        case(SEL)

            1'b0: D <= A;
            1'b1: D <= B;

        endcase

    end

endmodule

module mux4x1_16b(A,B,C,D,SEL,E);

    input [15:0] A,B,C,D;
    input [1:0] SEL;
    output reg[15:0] E;

    always @ (A or B or C or D or SEL) begin

        case(SEL)

            2'b00: E <= A;
            2'b01: E <= B;
            2'b10: E <= C;
            2'b11: E <= D;
            
        endcase

    end

endmodule

    