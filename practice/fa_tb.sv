module fa_tb();
	logic a,b,cin,sum,cout;
	//bit clk,rst;
	fa dut(.*);
	initial begin
	a=0;b=0;cin=0; #10;
	a=1;b=1;cin=0; #10;
	a=1;b=0;cin=1; #10;
	a=0;b=1;cin=0; #10;
	a=1;b=1;cin=1; #10;
	end
	
	initial begin
	$dumpfile("test.vcd");
	$dumpvars;
	#100 $finish;
	end
endmodule
	
