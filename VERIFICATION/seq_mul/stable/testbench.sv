module seq_mul_tb();
	logic [2:0]A;
	logic [2:0]P;
	logic [2:0]B;
	logic [2:0]Q;
	logic clk,loadA,loadB,decB;
	//regA dut(.*);
	regB dut(.*);
	initial clk=1'b0;
	always #5 clk=~clk;
	
	initial begin
		/*A=5;loadA=1;
		#10;*/
		B=5;loadB=1;decB=0;
		#30 loadB=0;decB=1;
	end
	
	initial begin
		
		$dumpfile("test.vcd");
		$dumpvars;
		#100 $finish;
	end
	
endmodule
			
	
