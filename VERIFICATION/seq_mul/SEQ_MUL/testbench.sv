module regA_tb();
	logic [1:0]A;
	logic [1:0]P;
	logic clk,loadA;
	logic [1:0]B;
	logic [1:0]Q;
	logic loadB,decB,start;
	logic [1:0]product;
	logic loadF,clear;
	logic zero;/*
	logic [1:0]B;
	clk;
	*/
	
	//regA DUT(.*);
	//regB dut(.*);
	//regF dut(.*);
	//comparator dut1(.*);
	data_path dut(.*);
 	controlpath dut1(.*);
	initial clk=1'b0;
	always #5 clk=~clk;
	initial begin
		A=2;B=2;
      start=1;
      /*clear=1'b1;#10;
		loadA=0; loadB=0; #10;
		loadA=1;loadB=1;decB=0; #30;
		//#30;
		loadB=0;decB=1;clear=1'b0; #30;
		B=3;#20;*/
		
		
	end /*
	//initial begin
		B=3;#10;
		loadB=0; #10;
		loadB=1;decB=0; #10;
		loadB=0;decB=1; #10;
	end
	initial begin
		B=0; 	clear=1'b1; #20;//clear=1'b1;
		B=3; 	clear=1'b1; #20;
		clear=1'b0; 
	end*/
	initial begin
		$dumpfile("test.vcd");
		$dumpvars;
		#200 $finish;
	end
endmodule 

