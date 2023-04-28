//Agent has driver, sequence, monitor
`include "mul_driver.svh"
`include "mul_sequence.svh"
class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)
	
	//my_sequence seq;
	my_driver driver;
	
	uvm_sequencer #(seq_item) sequencer;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		driver = my_driver::type_id::create("driver",this);
		sequencer = uvm_sequencer #(seq_item)::type_id::create("sequencer",this);
	endfunction
	
	//connect phase - connect driver and sequencer
	function void connect_phase(uvm_phase phase);
		driver.seq_item_port.connect(sequencer.seq_item_export);//check the underscore after driver
	endfunction
	
	task run_phase (uvm_phase phase);
		
		phase.raise_objection(this);
		//repeat(5)
		begin
			my_sequence seq;
			seq = my_sequence::type_id::create("seq");
			seq.start(sequencer);
			#100;
		end
		phase.drop_objection(this);
		
	endtask
endclass
