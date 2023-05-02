class my_monitor extends uvm_monitor;
	`uvm_component_utils(my_monitor)
	virtual mul_interface mul_vif;
	uvm_analysis_port#(seq_item) mon_port;
	
	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		mon_port=new("mon_port", this);
		if(!uvm_config_db #(virtual mul_interface) ::get(this,"","mul_vif",mul_vif))
			`uvm_error("","uvm_config_db::get failed")
	endfunction
	
	task run_phase(uvm_phase phase);
	
	seq_item seq;
	seq=seq_item::type_id::create("seq",this);
	
	//forever 
	begin
	@(posedge mul_vif.clk)
	if(mul_vif.zero == 1'b1)
	//`uvm_info("MONITOR ", $sformatf("A  = %h, B = %h, product = %d",mul_vif.A,mul_vif.B,mul_vif.product), UVM_MEDIUM);
	mon_port.write(seq);
	end
	endtask
endclass
