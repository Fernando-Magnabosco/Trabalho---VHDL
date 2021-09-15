module BC(

    input [0:0] START,RST,clk,
    output reg [0:0] LX, LS, LH, H, finished,
    output reg [1:0] M0,M1,M2

);

    reg [3:0] state;

    initial begin

        state = 4'b0000;
        LX = 1'b0;
        LS = 1'b0;
        LH = 1'b0;
        finished = 1'b0;

    end

    always @ (posedge clk or negedge RST) begin
        
        if (RST) begin
            
            state = 4'b0000;
            LX = 1'b0;
            LS = 1'b0;
            LH = 1'b0;
            finished = 1'b0;

        end

        else begin
            
            case(state)

                4'b0000: begin
                    
                    if(START)begin
                        
                        state <= 4'b0001;
                        LX = 1'b1;
                        M1 = 2'b01;
                        M2 = 2'b00;
                        H = 1'b1;

                    end
                    
                end

                4'b0001: begin

                        state <= 4'b0010;
                        LH = 1'b1;
                        LX = 1'b0;
                        M0 = 2'b01;
                        M1 = 2'b00;
                        M2 = 2'b11;
                        
                end

                4'b0010: begin
                    
                        state <= 4'b0011;
                        M0 = 2'b10;
                        M2 = 2'b00;
                

                end

                4'b0011: begin
                    
                        state <= 4'b0100;
                        LS = 1'b1;
                        LH = 1'b0;
                        M1 = 2'b10;
                        M2 = 2'b11;
                        H = 1'b0;

                end 

                4'b0100: begin
                    
                        state <= 4'b0101;
                        M0 = 2'b11;
                        M1 = 2'b00;
                        M2 = 2'b10;

                end

                4'b0101: begin
                    
                        state <= 4'b0110;

                end

                4'b0110: begin
                    
                    finished = 1'b1;
                    LS = 1'b0;
                        
                end
                

            endcase

        end 

            
    end

endmodule