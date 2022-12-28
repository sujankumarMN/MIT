package mul_package;
	typedef enum{rst,load} mul_type;
	class mul_transaction;
		bit load;
		rand bit [3:0]a,b;
		bit op_ready;
		bit [7:0]product;
		rand mul_type mtype;
	endclass
endpackage:mul_package

