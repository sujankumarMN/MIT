module mux2_1_tb();
logic i0,i1,s;
logic out;

mux2_1 a(.*);
 
initial begin

s=1'b0;i0=1'b1; i1=1'b0;
#5 s=1'b1;i0=1'b1; i1=1'b0; 
#20 $finish;
end


endmodule
