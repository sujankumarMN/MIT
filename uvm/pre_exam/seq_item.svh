class seq_item extends uvm_sequence_item;
	`uvm_object_utils_begin(seq_item)
	`uvm_field_int(a,UVM_ALL_ON)
	`uvm_field_int(b,UVM_ALL_ON)
	`uvm_field_int(c,UVM_ALL_ON)
	`uvm_object_utils_end
	
	randc [3:0]a;
	randc [3:0]b;
	randc c;
	
	function new(string name = "seq_item");
		super.new(name);
	endfunction
	
endclass
	
	
	
	
