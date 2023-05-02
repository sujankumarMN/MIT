`include "mul_package.svh"
`include "controlpath.sv"
`include "datapath.sv"
`include "mul_interface.sv"
module top();
	import uvm_pkg::*;
	import my_package::*;
	bit clk;
	
	mul_interface mul_if(clk);
	data_path data(mul_if);
	controlpath control(mul_if);
	
	initial clk=1'b0;
	always #5 clk=~clk;

	
	initial begin
		uvm_config_db #(virtual mul_interface) :: set(null,"*","mul_vif",mul_if);
		
		run_test("my_test");
		
		
	end
	/*
	initial begin
	#1000 $finish;
	end*/
endmodule
