`include "interface.sv"
module add_tb();
	
	
	add_interface intf();
	add dut(.i(intf));
	initial begin
	#10 intf.a=4'b0010;intf.b=4'b1000;intf.c=1'b1; #10;
	end
endmodule
