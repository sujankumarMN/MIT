package counter_package;
	typedef enum {LOAD, UPCOUNT, LOAD_UPCOUNT, RST_CHK} counter_type;
	`define cwidth=4;
	class counter_transaction #(cwidth=`cwidth)
	bit en, load;
	rand bit [cwidth-1:0] d;
	bit [cwidth:0] q;
	rand counter_type ctype;
	constraint d_constr {d[0]=0;}
	endclass
endpackage:counter_package
