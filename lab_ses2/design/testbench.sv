module testbench();
	logic [2:0]q;
	logic clk,rst,en;
	divide_by_3 dut(.*);
	
	initial clk=1'b0;
	always #250 clk=~clk;
	
	initial begin
		//#30
		rst=0; 
		 en=1;
		#50;
	end
	
	initial begin
	$dumpfile("test.vcd");
	$dumpvars;
	#8000 $finish;
	end
endmodule
	
