//`include "ram_package.sv"
import ram_package::*;
class ram_driver;
	ram_transaction rdrv;
	mailbox mbox2drv;
	virtual ram_interface ram_interface_driver;
	function new (mailbox mbox2drv,virtual ram_interface ram_interface_driver);
	
		this.mbox2drv=mbox2drv;
		this.ram_interface_driver=ram_interface_driver;
	
	endfunction
   extern task run();
   extern task send_to_dut(ram_transaction ram_drive);
endclass
	
	
	task ram_driver::run();
		rdrv=new;
		@(posedge ram_interface_driver.clk);
			mbox2drv.get(rdrv);
	//	if(rdrv.rtype==reset)
		//	send_to_dut(rdrv);
		 if(rdrv.rtype==write)
			send_to_dut(rdrv);
		else if(rdrv.rtype==read)
		 	send_to_dut(rdrv);
		else if(rdrv.rtype==self)
		 	send_to_dut(rdrv); 	
   endtask
  
    task ram_driver::send_to_dut(input ram_transaction ram_drive);//specify direction
    	@(posedge ram_interface_driver.clk)
		begin
			//if(ram_drive.rtype == reset)
			//begin 
				//#10 ram_drive.reset=1; #50;
			//end
			if(ram_drive.rtype== write)
			begin 
				#10 ram_drive.cs=1;ram_drive.we=1;ram_drive.data_in=8'b1010_0000; ram_drive.address=10'd120;#20;
			end
			if(ram_drive.rtype== read)
			begin 
				#10 ram_drive.cs=1;ram_drive.we=1;ram_drive.data_in=8'b1010_0000; ram_drive.address=10'd120;#10;
				ram_drive.cs=1;ram_drive.we=0;#10;
				ram_drive.oe=1;#20; 
			end
			if(ram_drive.rtype== self)
			begin 
				#10 ram_drive.cs=1;ram_drive.we=1;ram_drive.data_in=8'b1111_0000; ram_drive.address=10'd111; #10;
				ram_drive.cs=1;ram_drive.we=0;#10;
				ram_drive.oe=1;#20;
				//reset=1;#50;
				//reset=0;#20;
			end
		end
	endtask











/*

task ram_driver::run();
	cdrv=new;
	@(posedge ram_interface_driver.clk);
		mbox2drv.get(cdrv);
	if(cdrv.name==reset)
		send_to_dut(cdrv);
	else if(cdrv.name==write)
		send_to_dut(cdrv);
	else if(cdrv.name==read)
	 	send_to_dut(cdrv);
	else if(cdrv.name==self)
	 	send_to_dut(cdrv); 	
endtask

task ram_driver::send_to_dut(ram_transaction ram_drive);
	@(posedge ram_interface_driver.clk)
		begin
			if(ram_drive.name == reset)
			begin 
				#10 ram_drive.reset=1; #50;
			end
			if(ram_drive.name == write)
			begin 
				#10 ram_drive.cs=1;ram_drive.we=1;ram_drive.data_in=8'b1010_0000; ram_drive.address=10'd120;#20;
			end
			if(ram_drive.name == read)
			begin 
				#10 ram_drive.cs=1;ram_drive.we=1;ram_drive.data_in=8'b1010_0000; ram_drive.address=10'd120;#10;
				ram_drive.cs=1;ram_drive.we=0;#10;
				ram_drive.oe=1;#20; 
			end
			if(ram_drive.name == self)
			begin 
				#10 ram_int.cs=1;ram_int.we=1;ram_int.data_in=8'b1111_0000; ram_int.address=10'd111; #10;
				ram_int.cs=1;ram_int.we=0;#10;
				ram_int.oe=1;#20;
				reset=1;#50;
				reset=0;#20
			end
		end
endtask*/
