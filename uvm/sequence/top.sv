`include "uvm_macros.svh"
`include "seq.sv"
module top;
	//mem_seq_item seq_item;
	mem_seq_item seq_item1;
	mem_seq_item seq_item2;
	mem_seq_item seq_item3;
	initial begin
		/*seq_item=new;
		//seq_item=mem_seq_item::type_id::create("seq_item",this);
		seq_item.randomize();
		seq_item.print();*/
		
		//uvm_info("""seq1 displaying....");
		seq_item1=mem_seq_item::type_id::create();
		seq_item1.randomize();
		seq_item1.print();
//---------- different data for each object----------------//		
		seq_item2=mem_seq_item::type_id::create();
		seq_item2.randomize();
		seq_item2.print();
		
		if(seq_item1.compare(seq_item2))
			//$display($time,"yessss");
			`uvm_info("","this is yesssss",UVM_LOW)
		else
			`uvm_error("","this is nooooo")
//----------copy data--------------------------------------//
		seq_item2.copy(seq_item1);
		if(seq_item1.compare(seq_item2))
			//$display($time,"yessss");
			`uvm_info("","this is yesssss",UVM_LOW)
		else
			`uvm_error("","this is nooooo")
//---------clone data------------------------------------//
		
		$cast(seq_item3,seq_item2.clone());
		if(seq_item1.compare(seq_item2))
			//$display($time,"yessss");
			`uvm_info("","this is yesssss",UVM_LOW)
		else
			`uvm_error("","this is nooooo")
		
		
	end
endmodule
