`include "counter.sv"
`include "counter_interface.sv"
`include "counter_env.sv"


module counter_tb();
	bit clk,reset;
	initial begin clk=1'b0; reset=1'b0; end
	always #5 clk=~clk;
	
	counter_interface cont_int(clk,reset);
	count_env env(cont_int);	
	counterr dut1(cont_int);
	/*
	
	initial begin
		if($test$plusargs("reset"))
			begin reset=1'b1; end
		else if($test$plusargs("up_count"))
			begin cont_int.load_en=1'b0; cont_int.count_en=1'b1; end
		else if($test$plusargs("down_count"))
			begin cont_int.load_en=1'b0; cont_int.count_en=1'b0; end
		
	end

*/
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(1);
		#200 $finish;
	end

endmodule























	/*initial begin
		cont_int.load_en=1'b0; cont_int.count_en=1'b1; #10;
		cont_int.load_en=1'b1; cont_int.count_en=1'b0; cont_int.data=8'b0000_1111; #25;
		cont_int.load_en=1'b0;cont_int.count_en=1'b1;#45;
		reset=1'b1; #30;
		reset=1'b0;cont_int.load_en=1'b1; cont_int.count_en=1'b0; cont_int.data=8'b1111_0000; #25;
		cont_int.load_en=1'b0;cont_int.count_en=1'b0;#45;
		
		//always @(negedge clk) reset=~reset;
		
	end*/
