module test_op();
 wire [3:0]a=4'b0001;
 wire b;
 wire [3:0]c;
 assign b=~a;
 assign c=~a;
 initial begin
 #10;
 $display("logical: %b",b);
 $display("bitwise: %b",c);
 end
endmodule
