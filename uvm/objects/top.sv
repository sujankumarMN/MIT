`include "uvm_macros.svh"
`include "object.sv"
`include "test.svh"
module top;
	initial begin
		run_test("my_test");
		//#100 $finish;
	end
endmodule
