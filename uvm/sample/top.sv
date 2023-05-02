`include "package.sv"
`include "what.sv"
`include "interface.sv"
module top;
	import uvm_pkg::*;
	import my_pkg::*;
	
	uvm_interface intf();
	what dut(intf);
	
	initial begin
		run_test("my_test");
	end
endmodule:top
