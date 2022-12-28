module mux4_1_tb();
logic i0,i1,i2,i3,s0,s1;
logic out;

mux4_1 a(.*);
 
initial begin

s0=1'b0; s1=1'b0;i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1;
#5 s0=1'b0; s1=1'b1;i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1;
#5 s0=1'b1; s1=1'b0;i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1;  
#5 s0=1'b1; s1=1'b1;i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1;
#5 s0=1'bz; s1=1'bz;i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1;
#20 $finish;
end


endmodule
