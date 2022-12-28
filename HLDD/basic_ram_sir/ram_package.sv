
package ram_package;
	typedef enum {reset,write,read,self} ram_type;
	
	class ram_transaction;
		bit cs,we,oe;
		bit [7:0]data_in;
		bit [7:0]data_out;
		bit [7:0]address; 
		ram_type rtype;
	endclass
	
endpackage:ram_package
