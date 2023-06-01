`include "driver.svh"
`include "seq.svh"
class agent extends uvm_agent;
	`uvm_component_utils(agent)
	driver drv;
	uvm_sequencer#(seq_item) seqr;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		drv = driver::type_id::create("drv",this);
		seqr = uvm_sequencer #(seq_item)::type_id::create("seqr",this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		drv.seq_item_port.connect(seqr.seq_item_export);//check the underscore after driver
	endfunction
	
	task run_phase(uvm_component phase);
	phase.raise_objection(this);
	begin
		seq s;
		s=seq::type_id::create("s",this);
		s.start(seqr);
	end
	phase.drop_objection(this);
	endtask
endclass
