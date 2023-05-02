class mul_generator;
	mul_transaction mgen;
	mailbox gen2mbox;
	
	function new(mailbox gen2mbox);
		this.gen2mbox=gen2mbox;
	endfunction
	
	extern task run();
endclass

task mul_generator::run();

begin
	mgen=new;
	//mgen.randomize();
	mgen.A=4'b1111;
	mgen.B=4'b1111;
	$display("[GENERATOR] A and B generated. A= %0d, B=%0d ",mgen.A,mgen.B);
	gen2mbox.put(mgen);
end
endtask
	
