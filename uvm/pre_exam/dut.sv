module add(intf i);
	/*logic [3:0]a,b,sum;
	logic c,carry;*/
	assign i.sum=i.a^i.b^i.c;
	assign carry=(i.a*i.b)+(i.b*i.c)+(i.c*i.a);
endmodule
