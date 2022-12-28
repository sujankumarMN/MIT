interface counter_interface #(cwidth=`cwidth)(input bit clk,rst);
	logic en,load;
	logic [cwidth-1:0]d;
	logic [cwidth-1:0]q;
	modport counter (input en,load,clk,rst,d,output q);
endinterface:counter_interface
