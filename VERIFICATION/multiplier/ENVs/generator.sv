
class mul_generator;
	mul_transaction mgen;
	mailbox mgen2mbox;
	function new(mailbox mgen2mbox);
		this mgen2mbox=mgen2mbox;
	endfunction
	
	extern task run(string stringname);
endclass

task mul_generator::run(string stringname);
	begin
		if(stringname="rst")
			begin
				mgen=new;
				assert(mgen.randomize with{mtype==rst;})
				mgen2mbox.put(mgen);
				$display("Generator: RESET operation is in progress");
			end
		if(stringname="load")
			begin
				mgen=new;
				assert(mgen.randomize with{mtype==load;})
				mgen2mbox.put(mgen);
				$display("Generator: LOAD operation is in progress");
			end	
	end
endtask

