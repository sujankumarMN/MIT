module test_or_gate();
	reg test_a;
	reg test_b;
	wire test_out;
	or_gate dut1(.a(test_a),.b(test_b),.out(test_out));
	initial begin	
		test_a=1'b0;
		test_b=1'b0;#5;
		test_a=1'b0;
		test_b=1'b1;#5;
		test_a=1'b1;
		test_b=1'b0;#5;
		test_a=1'b1;
		test_b=1'b1;#5;
	end
	initial begin
		$monitor($time,"in1=%b,in2=%b,output=%b",test_a,test_b,test_out);
		$dumpvars;
		$dumpfile("test1.vcd");
	end
endmodule
