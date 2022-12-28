module decoder_tb();
 	logic a1,a0,e;
	logic y3,y2,y1,y0;

	decoder a(.*);

 	initial begin
	e = 0;
  #5 e = 1;
  #5 a1 = 1'b0; a0 = 1'b0;
	#5 a1 = 1'b0; a0 = 1'b1;
	#5 a1 = 1'b1; a0 = 1'b1;
	#5 e = 0;
	#5 a1 = 1'b1; a0 = 1'b1;
	#100 $finish;
	end
endmodule	
