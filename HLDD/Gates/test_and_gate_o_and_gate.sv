module test_and_gate_o_and_gate();
	reg test_a;
	reg test_b;
	reg test_d;
	wire test_out1;
	wire test_out2;
	and_gate_o_and_gate dut(.a(test_a),.b(test_b),.d(test_d),.out1(test_out1),.out2(test_out2));
	initial begin
		test_a=1'b0;
		test_b=1'b1;
		test_d=1'b1;#5;
		test_a=1'b1;
		test_b=1'b1;
		test_d=1'b0;#5;
		test_a=1'b1;
		test_b=1'b1;
		test_d=1'b1;#5;
	end
	initial begin
		$monitor($time,"a=%b,b=%b,d=%b",test_a,test_b,test_d);
	end
endmodule


