module HA_tb();
	reg a,b;
	wire c;
	HA dut(.*);
	initial begin 
	a=1'b0 ; b= 1'b0; #5;
	a=1'b0 ; b= 1'b1; #5;
	a=1'b1 ; b= 1'b0; #5;
	a=1'b1 ; b= 1'b1; #5;
	end
	initial begin
	$dumpfile("test.vcd");
	$dumpvars();
	end
endmodule
