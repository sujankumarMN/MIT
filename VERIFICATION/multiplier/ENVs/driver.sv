
class mul_driver;
	mul_transaction mdrv;
	mailbox mbox2mdrv;
	virtual mul_interface mul_interface_driver;
	function new(mailbox mbox2drv,mul_interface mul_interface_driver);
		this.mbox2drv=mbox2drv;
		this.mul_interface_driver=mul_interface_driver;
	endfunction
	extern task run();
	extern task send_to_dut(mul_transaction mul_drive);
endclass

task mul_driver::run();
	mdrv=new;
	@posedge(mul_interface_driver.clk);
	mbox2mgen.get(mdrv);
	if(mdrv.name==rst)
		send_to_dut(mdrv);
	else if(mdrv.name==load)
		send_to_dut(mdrv);
endtask

task mul_driver::send_to_dut(input mul_transaction mul_drive);
	@(posedge mul_interface_driver.clk)
	if(mul_drive.name==rst)
	begin
		mul_interface_driver.rst=1'b1;
		mul_interface_driver.load=1'b0;
		$display("DRIVER to DUT: RESET is given");
	end
	@(posedge mul_interface_driver.clk)
	if(mul_drive.name==load)
	begin
		mul_interface_driver.rst=1'b0;
		mul_interface_driver.load=1'b1;
		mul_interface_driver.a=mul_drive.a;
		mul_interface_driver.b=mul_drive.b;
		$display("DRIVER to DUT: LOAD is given");
	end
endtask
		
		
