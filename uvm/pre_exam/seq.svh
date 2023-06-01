class seq extends uvm_sequence#(seq_item);
	`uvm_object_utils(seq)
	function new(string name = "seq");
		super.new(name);
	endfunction
	
	task body();
		seq_item sq = seq_item::type_id::create("sq",this);
		start_item(sq);
		sq.randomize();
		finish_item(sq);
	endtask
endclass
	
	
