`include "my_package.svh"
`include "dut.sv"
`include "dut_if.sv"
module top();
	import uvm_pkg::*;
	import my_package::*;
	
	dut_if dut_if1();
	dut dut1(.if1(dut_if1));
	
	initial begin
		dut_if1.clock = 0;
		forever #5 dut_if1.clock = ~dut_if1.clock;
	end
	
	initial begin
		uvm_config_db #(virtual dut_if) :: set(null,"*","dut_vif",dut_if1);
		run_test("my_test");
	end
	
	initial begin
	#200 $finish;
	end
endmodule
