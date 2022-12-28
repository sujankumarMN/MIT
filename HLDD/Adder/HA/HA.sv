`include "../and/and.sv"

module HA(input a,b, output reg c);
	and_gate a1(a,b,c);
endmodule
