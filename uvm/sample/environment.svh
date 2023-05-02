class my_env extends uvm_env;
	`uvm_component_utils(my_env)
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction:build_phase
	
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		#10;
		$display("THIS IS UVM FIRST CLASS");
		phase.drop_objection(this);
	endtask:run_phase
	
endclass
		
	
