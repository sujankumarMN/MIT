
class counter_generator #(cwidth=`cwidth);
	counter_transaction cgen;
	mailbox cgen2mbox;
	function new(mailbox cgen2mbox)
		this.cgen2mbox=cgen2mbox;
	endfunction
	extern task run(string stringname);
endclass

task counter_generator::run(string stringname);
begin
	if(stringname == "load")
	begin
		cgen=new;
		assert(cgen.randomize with{ctype==LOAD;})
		cgen2mbox.put(cgen);
		$display("Generator: LOAD operation is in progress");
	end

	if(stringname == "up")
	begin
		cgen=new;
		assert(cgen.randomize with{ctype==UPCOUNT;})
		cgen2mbox.put(cgen);
		$display("Generator: UPCOUNT operation is in progress");
	end
end
endtask
	
