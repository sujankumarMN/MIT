`include "env.svh"
class test extends uvm_test;
	`uvm_component_utils(test)
	env e1;
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		e1 = env::type_id::create("e1",this);
	endfunction
	
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		begin
			#10;
			`uvm_warning("","Hi, this is a WAAARNINGGGGG message");
		end
		phase.drop_objection(this);
	endtask
endclass
