module d_ff(clk,d,q);
 input clk;
 input d;
 output q;
 reg q;
 always @(posedge clk)
  d=q;
endmodule
