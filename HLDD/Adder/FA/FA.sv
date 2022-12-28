`include "../and/and.sv"
`include "../or/or.sv"
`include "../xor/xor.sv"

module FA(input a,b,c,output reg sum,cout);
	wire ab,abc,a_b;
	xor_gate sum1(a,b,a_b);
	xor_gate sum2(a_b,c,sum);
	and_gate car1(a_b,c,abc);
	and_gate car2(a,b,ab);
	or_gate car3(abc,ab,cout);
endmodule
	
	
