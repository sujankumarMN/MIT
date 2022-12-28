package mul_package;

	class mul_transaction;
		randc bit [1:0]A;
		randc bit [1:0]B;
		bit [3:0]product;
		bit loadA,loadB,decB,loadF,clear,zero,start;
		bit [1:0]P;
		bit [1:0]Q;
		constraint c1{A != 2'b00 ; B!=2'b00 ;}
	endclass
endpackage
