class my_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(my_scoreboard)
	
	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	uvm_analysis_imp #(seq_item,my_scoreboard) sb_port;
	
	function void build_phase(uvm_phase phase);
		sb_port=new("sb_port",this);
	endfunction
	
	function void write (seq_item seq);
	`uvm_info("SCOREBOARD",$sformatf("a=%d,b=%d,prod=%d",seq.A,seq.B,seq.product),UVM_LOW);
	endfunction
	
endclass
		
