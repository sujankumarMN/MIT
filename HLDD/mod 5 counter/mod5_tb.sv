module mod5_tb();
	logic clk,rst;
	logic [2:0]q;
	mod5 dut(.*);
	initial clk=1'b0;
	always #5 clk=~clk;
	initial begin
		rst=1'b1;#10;
		rst=1'b0; #10;
	end
	initial
	#200 $finish;
endmodule
		
