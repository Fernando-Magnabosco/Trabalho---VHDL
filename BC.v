module BO(

    input [0:0] START,RST,clk,
    output reg [0:0] LX, LS, LH, SEL_ULA,
    output reg [1:0] M0,M1,M2

);

    reg [3:0] state;

    always @ (posedge clk or negedge RST) begin
        
        if (RST) begin
            
                LX = 0;
                LS = 0;
                LH = 0;
                state = 4'b0000;

        end
        else begin
            
            case(state)

                4'b0000: begin
                    
                    if(START)begin
                        
                        state <= 4'b0001;

                    end
                    
                end

                4'b0001: begin

                        LX = 1'b1;
                        LH = 1'b1;
                        M1 = 2'b01;
                        M2 = 2'b00;
                        SEL_ULA = 1'b1;
                        
                end

        end 

            endcase

    end

endmodule