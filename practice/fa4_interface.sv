interface fa4_interface;
	logic [3:0]a,b,sum;
	logic cin,cout;
	modport fa4(input a,b,cin,output sum,cout);
	modport incr5(input a,b,cin,output sum,cout);
endinterface
