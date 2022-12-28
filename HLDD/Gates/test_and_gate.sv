module test_and_gate();
	reg test_a;
	
	reg test_d;
	reg test_b;
	wire test_out;
	wire test_out1;
	and_gate dut(.a(test_a),.b(test_b),.out(test_out));
        and_gate dut1(.a(test_d),.b(test_out),.out(test_out1));
	initial begin
		
		test_a=1'b0;
		test_b=1'b0;
		
		test_d=1'b1;
		#5;
		test_a=1'b0;
		test_b=1'b1;
	
		test_d=1'b0;
		#5;
		test_a=1'b1;
		test_b=1'b0;
		
		test_d=1'b1;
		#5;
		test_a=1'b1;
                test_b=1'b1;
	
		test_d=1'b1;
		#5;
	end
	initial begin
	$monitor($time,"in1=%b,in2=%b,out1=%b",test_a,test_b,test_out);
	$monitor($time,"in3=%b,in4=%b,out2=%b",test_d,test_out,test_out1);
	$dumpvars;
	$dumpfile("test.vcd");
	end
endmodule



	
