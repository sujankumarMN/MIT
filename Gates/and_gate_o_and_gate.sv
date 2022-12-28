module and_gate_o_and_gate(a,b,d,out1,out2);
	input a,b,d;
	output out1,out2;
	assign out1=a&b;
	assign out2=out1&d;
endmodule
