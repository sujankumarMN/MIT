`include "fa.sv"
`include "fa4_interface.sv"
module incr5_tb();
	fa4_interface fint();
	incr5 dut(fint);
	initial begin
	fint.a=5; #10;
	fint.a=2; #10;
	end
	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars;
		#1000 $finish;
	end
endmodule
	
