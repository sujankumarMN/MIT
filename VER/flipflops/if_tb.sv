module if_tb();
 reg a,b;
 wire out;
 ifff dut(.*);
 initial begin
    a=1'b0;b=1'b0;
 #5 a=1'b0;b=1'b1;
 #5 a=1'b1;b=1'b0;
 #5 a=1'b1;b=1'b0;#5;
 end
 
endmodule
 
