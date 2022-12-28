class ses_generator;
	ses_transaction sgen;
	mailbox sgen2mbox;
	
	function new(mailbox sgen2mbox);
		this.sgen2mbox=sgen2mbox;
	endfunction
	
	extern task run(string stringname);
endclass

task ses_generator::run(string stringname);
begin
	if(stringname == "A")
	begin
		sgen=new;
		sgen.s_type=A;
		sgen.randomize();
		sgen.command=4'b0000;
		sgen.master_id=2'b00;
		sgen.parity=1'b1;
		$display("[GENERATOR] A generated... ");
		sgen2mbox.put(sgen);
	end
	
	if(stringname == "B")
	begin
		sgen=new;
		sgen.s_type=B;
		sgen.randomize();
		sgen.header=12'b001_0000_0000;
		sgen.command=4'b0010;
		sgen.master_id=2'b01;
		sgen.parity=1'b0;
		$display("[GENERATOR] B generated... ");
		sgen2mbox.put(sgen);
	end
	
	if(stringname == "C")
	begin
		sgen=new;
		sgen.s_type=C;
		sgen.randomize();
		sgen.header=12'b0010_0000_0000;
		sgen.payload=8'b1010_1010;
		sgen.command=4'b0100;
		sgen.master_id=2'b10;
		sgen.parity=1'b1;
		$display("[GENERATOR] C generated... ");
		sgen2mbox.put(sgen);
	end
end
endtask
