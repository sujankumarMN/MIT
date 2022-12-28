
class ses_driver;
	ses_transaction sdrv;
	mailbox mbox2drv;
	
	function new(mailbox mbox2drv);
		this.mbox2drv=mbox2drv;
	endfunction
	
	extern task run();
	extern task result(ses_transaction ses_drive);
	
endclass

task ses_driver::run();
begin
	sdrv=new;
	mbox2drv.get(sdrv);
	result(sdrv);
end
endtask

task ses_driver::result(ses_transaction ses_drive);
begin
	
	begin
		$display("\nTESTCASE: %0s",ses_drive.s_type.name);
		$display("\nHEADER: %0h",ses_drive.header);
		$display("\nPAYLOAD: %0h",ses_drive.payload);
		$display("\nCOMMAND: %0b",ses_drive.command);
		$display("\nMASTER_ID: %0b",ses_drive.master_id);
		$display("\nPARITY: %0b",ses_drive.parity);
	end
end
endtask
