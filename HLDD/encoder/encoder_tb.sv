module encoder_tb();
	logic y3,y2,y1,y0;
	logic a1,a0;

encoder a(.*);
 
initial begin

 y3=1'b0; y2=1'b0;y1=1'b1; y0=1'b0;
#5 y3=1'b0; y2=1'b1;y1=1'b0; y0=1'b0;
#5 y3=1'bz; y2=1'bz;y1=1'bz; y0=1'bz;
#20 $finish;
end


endmodule
