interface add_interface();
	logic [3:0]a,b,sum;
	logic c,carry;
	modport add(input a,b,c,output sum,carry);
endinterface
