interface mul_interface(input clk);
	logic [3:0]A;
	logic [3:0]B;
	logic [7:0]product;
	logic loadA,loadB,decB,loadF,clear,zero,start;
	logic [3:0]P;
	logic [3:0]Q;
	
	modport data_path(input clk,A,B,P,Q,loadA,loadB,decB,loadF,clear,output zero,product);
	modport controlpath(input clk,zero,start,output loadA,loadB,decB);
endinterface
