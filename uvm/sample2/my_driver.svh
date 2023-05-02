//Driver
`include "seq_item.svh"
class my_driver extends uvm_driver #(seq_item);
	`uvm_component_utils(my_driver)
	virtual dut_if dut_vif;
	
	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		//Get interface reference from config DB
		if(!uvm_config_db #(virtual dut_if) ::get(this,"","dut_vif",dut_vif))
			`uvm_error("","uvm_config_db::get failed")
	endfunction
	
	task run_phase(uvm_phase phase);
		dut_vif.reset=1;
		@(posedge dut_vif.clock);
		#4
		dut_vif.reset=0;
		
		forever begin
		seq_item_port.get_next_item(req);  //there might be underscore after get
		//toggle the inputs
		dut_vif.cmd = req.cmd;
		dut_vif.addr = req.addr;
		dut_vif.data = req.data;
		@(posedge dut_vif.clock);
		seq_item_port.item_done();
		end
	endtask
endclass:my_driver
