//Driver
`include "mul_seq_item.svh"
class my_driver extends uvm_driver #(seq_item);
	`uvm_component_utils(my_driver)
	virtual mul_interface mul_vif;
	
	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		//Get interface reference from config DB
		if(!uvm_config_db #(virtual mul_interface) ::get(this,"","mul_vif",mul_vif))
			`uvm_error("","uvm_config_db::get failed")
	endfunction
	
	task run_phase(uvm_phase phase);
		//req.start=1;
		@(posedge mul_vif.clk);
		
		forever begin
		seq_item_port.get_next_item(req);  //there might be underscore after get
		req.start=1;
		//toggle the inputs
		mul_vif.A = req.A;
		mul_vif.B = req.B;
		mul_vif.start = req.start;
		mul_vif.product = req.product;
		//mul_vif.loadA = req.loadA;
		//mul_vif.loadB = req.loadB;
		//mul_vif.decB = req.decB;
		//mul_vif.loadF = req.loadF;
		//mul_vif.clear = req.clear;
		//mul_vif.zero = req.zero;
		//mul_vif.start = req.start;
		//mul_vif.P = req.P;
		//mul_vif.Q = req.Q;
		
		
		@(posedge mul_vif.clk);
		//mul_vif.start=1'b0;
		seq_item_port.item_done();
		#50 mul_vif.start=1'b0;
		end
	endtask
endclass:my_driver
