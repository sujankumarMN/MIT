class counter_driver #(cwidth=`cwidth);
	counter_transaction cdrv;
	mailbox mbox2drv;

	virtual counter_interface counter_interface_driver;

	function new(mailbox mbox2drv, counter_interface_driver)
		this.mbox2drv=mbox2drv;
		this.counter_interface_driver=counter_interface_driver;
	endfunction
	extern task run();
	extern task send_to_dut(counter_transaction counter_drive);
endclass

task counter_driver::run();
	cdrv=new;
	@posedge(counter_interface_driver rst)
		mbox2drv.put(cdrv);
	if(cdrv.name==UPCOUNT)
	begin
		repeat(counter_width)
			send_to_dut(cdrv);
	end
	
	else if(cdrv.name=LOAD)
		send_to_dut(cdrv);
	
endtask	
	
