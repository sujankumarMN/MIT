
program ses_environment();
`include "ses_generator.sv"
`include "ses_driver.sv"
	mailbox gen2drv=new();
	ses_generator sesGen=new(gen2drv);
	ses_driver sesDrv=new(gen2drv);
	
	initial begin
		if($test$plusargs("A"))
			sesGen.run("A");
		else if($test$plusargs("B"))
			sesGen.run("B");
		else if($test$plusargs("C"))
			sesGen.run("C");
	end
	
	initial begin
	fork
		sesDrv.run();
	join
	end
	
	initial begin
		
		#100 $exit;
	end
endprogram
