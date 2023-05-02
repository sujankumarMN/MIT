`include "mul_generator.sv"
`include "mul_driver.sv"
`include "mul_monitor.sv"
`include "mul_scoreboard.sv"
program mul_environment(mul_interface m);
	mailbox gen2drv=new();
	mailbox mon2sb=new();
	mul_generator mulGen=new(gen2drv);
	mul_driver mulDrv=new(gen2drv,m);
	mul_monitor mulMon=new(mon2sb,m);
	mul_scoreboard mulSb=new(mon2sb);
	
	initial begin
	fork
		
		begin
			mulGen.run();
			mulDrv.run();
			mulMon.run();
			mulSb.run();
			
		end
	join
	end
	
	initial begin
	#200 $exit;
	end
endprogram
	
	
