`include "../FA/FA.sv"

module four_bit(a,b,cin,sum,cout);
	input [3:0]a;
	input [3:0]b;
	input cin;
	output [3:0]sum;
	output cout;
	 wire [2:0]temp_carry;
	 FA f1(a[0],b[0],cin,sum[0],temp_carry[0]);
	 FA f2(a[1],b[1],temp_carry[0],sum[1],temp_carry[1]);
	 FA f3(a[2],b[2],temp_carry[1],sum[2],temp_carry[2]);
	 FA f4(a[3],b[3],temp_carry[2],sum[3],cout);
endmodule
