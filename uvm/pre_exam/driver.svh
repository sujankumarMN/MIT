class driver extends uvm_driver#(seq_item);
	`uvm_component_utils(driver)
	virtual add_interface vif;
	
	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function build_phase(uvm_phase phase);
		if(!uvm_config_db#(virtual add_interface)::get(null,"","vif",vif))
			`uvm_info("DRIVER","No interfaceaaaaaaaaaaaaaaaaaaa",UVM_LOW)
	endfunction
	
	task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	forever begin
		seq_item_port.start(req);
		vif.a=req.a;
		vif.b=req.b;
		vif.c=req.c;
		seq_item_port.done();
	end
	endtask
endtask
	
