module ifff(a,b,out);
 input a,b;
 output out;
 reg out;
always @({a,b}) begin
 if(!a)
  assign out=1'b0;
 else
 begin
  if(b)
   assign out=1'b1;
  else
   assign out=1'bZ;
 end
end
endmodule
