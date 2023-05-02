//sequence item
class seq_item extends uvm_sequence_item;
	`uvm_object_utils(seq_item)
	
	randc bit [3:0]A;
	randc bit [3:0]B;
	bit [7:0]product;
	bit loadA,loadB,decB,loadF,clear,zero,start;
	bit [3:0]P;
	bit [3:0]Q;
	constraint c1{A != 4'b0000 ; B!=4'b0000 ;}

	function new(string name = " ");
		super.new(name);
	endfunction
	
endclass:seq_item
	
	
