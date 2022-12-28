`include "package.sv"
import ses_package::*;
`include "ses_environment.sv"

module ses_top();
	
	ses_environment senv();
	
	initial begin
	$dumpfile("test.vcd");
	$dumpvars;
	#100 $finish;
	end
endmodule
