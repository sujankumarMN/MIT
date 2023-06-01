module top();
`include "package.svh"
`include "dut.sv"
`include "interface.sv"

	import uvm_pkg::*;
	import pack::*;
	
	
	add_interface intf();
	add d1(.i(intf);
	
	initial begin
		uvm_config_db #(virtual dut_if) :: set(null,"*","vif",intf);
		run_test("test");
	end
	initial begin
	#200 $finish;
	end
endmodule
