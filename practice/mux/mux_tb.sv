module mux_tb();
	logic a,b,c,y;
	mux dut(.*);
	initial begin
	#10;
	a=0;b=0;c=0;#10;
	a=0;b=0;c=1;#10;
	a=0;b=0;c=0;#10;
	a=0;b=1;c=0;#10;
	a=0;b=1;c=1;#10;
	a=1;b=0;c=0;#10;
	a=1;b=0;c=1;#10;
	a=1;b=1;c=0;#10;
	a=1;b=1;c=1;#10;
	end
endmodule
