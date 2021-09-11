`include "BO";


module testbench;

always #1 begin
     
     clk <= ~clk;

end

initial begin
     
     $dumpvars;
     x = 8'b00000001;  #1;
     x = 8'b00000011;  #1;
     x = 8'b00000111;  #1;
     x = 8'b00001111;  #1;
     $finish;

    
end
endmodule