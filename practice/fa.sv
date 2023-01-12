module fa(input a,b,cin,output sum,cout);
	logic a,b,cin,sum,cout;
	assign sum=a^b^cin;
	assign cout=(a*b)+(b*cin)+(cin*a);
endmodule

module fa4(fint f);
	/*logic [3:0]a,b,sum;
	logic cin,cout;*/
	initial f.b=4'b0101;
	wire [2:0]temp_carry;
	fa add1(f.a[0],f.b[0],f.cin,f.sum[0],temp_carry[0]);
	fa add2(f.a[1],f.b[1],temp_carry[0],f.sum[1],temp_carry[1]);
	fa add3(f.a[2],f.b[2],temp_carry[1],f.sum[2],temp_carry[2]);
	fa add4(f.a[3],f.b[3],temp_carry[2],f.sum[3],f.cout);
endmodule
/*
module incr_5(fint fi);
	initial fi.b=4'b0101;
	fa4 add(fint);
endmodule
	*/
