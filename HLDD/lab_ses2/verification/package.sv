package ses_package;
	typedef enum {A,B,C} stype;
	
	parameter N=12;
	class ses_transaction;
		randc bit[N-1:0]header;
		randc bit[N-1:0]payload;
		bit [3:0]command;
		bit [1:0]master_id;
		bit parity;
		//ack;
		stype s_type;
		constraint c1{header[0] == 0;}
		constraint c2{payload[N-1] == 1;}
	endclass
	
endpackage 
