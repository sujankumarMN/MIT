class mul_monitor;
	mul_transaction mmon;
	mailbox mbox2mmon;
	integer i;
	virtual mul_interface mul_interface_monitor;
	function new(mailbox mbox2mmon,virtual mul_interface mul_interface_monitor);
		this.mbox2mmon=mbox2mmon;
		this.mul_interface_monitor=mul_interface_monitor;
	endfunction
	
	extern task run();
endclass;

task mul_monitor::run();
begin
	mmon=new;
	for(i=0;i<3;i++)
	@(posedge mul_interface_monitor.clk);
	
	mmon.A=mul_interface_monitor.A;
	mmon.B=mul_interface_monitor.B;
	mmon.product=mul_interface_monitor.product;
	mmon.P=mul_interface_monitor.P;
	mmon.Q=mul_interface_monitor.Q;
	$display("[MONITOR] A=%0d x B=%0d === product =%0d",mmon.A,mmon.B,mmon.product);
	mbox2mmon.put(mmon);
end
endtask	 
