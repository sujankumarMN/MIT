class mul_scoreboard;
	mul_transaction msb;
	mailbox mbox2sb;
	
	function new(mailbox mbox2sb);
		this.mbox2sb=mbox2sb;
	endfunction
	
	extern task run();
endclass

task mul_scoreboard::run();
begin
	msb=new;
	mbox2sb.get(msb);
	
	$display("[SCOREBOARD] A=%0d,B=%0d,product=%0d",msb.A,msb.B,msb.product);
	
end
endtask
	
