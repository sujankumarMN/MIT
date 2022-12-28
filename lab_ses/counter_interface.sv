interface counter_interface(input bit clk,reset);
	logic[7:0]data,sys_out;
	logic count_en,load_en,out_even;
	modport counterr(input clk,reset,count_en,load_en,data,output sys_out,out_even);

/*
	clocking blk (@posedge clk)
		input  @(negedge clk) reset;
		default clk #3ns;
		output sys_out;
	endclocking*/

endinterface:counter_interface
