program mul_env(mul_interface mul_interface_test);
	`include "generator.sv"
	`include "driver.sv"
	mailbox gen2drv=new;
	mul_generator mul_gen=new(gen2drv);
	mul_driver mul_drv=new(gen2drv,mul_interface_test);
	initial begin
		if($test$plusargs("rst"))
			mul_gen.run("rst");
		else if($test$plusargs("load"))
			mul_gen.run("load");
		fork
			mul_drv.run();
		join
	end
	
	initial begin
		#200;
		$display("pro=%b",gen2drv.product); 
		$exit;
	end
endprogram:mul_env

