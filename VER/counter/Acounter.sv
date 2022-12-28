module Acounter(clk,j,k,q1,q2,q3,q1b,q2b,q3b);
 input j,k,clk;
 output q1,q2,q3,q1b,q2b,q3b;
 reg q1,q2,q3;
 //wire q1;
 //initial begin a=1'b1;b=
 jk jk1(clk,j,k,q1,q1b);
 jk jk2(q1,j,k,q2,q2b);
 jk jk3(q2,j,k,q3,q3b);
endmodule

module jk(clk,j,k,q,qb);
  input clk,j,k;
  output q,qb;
  reg q,qb;
  //initial begin q=0;qb=1; end
  always @(negedge clk)
      case({j,k})
        {1'b0,1'b0}: begin q=q;qb=qb; end
        {1'b0,1'b1}: begin q=0;qb=~q; end
        {1'b1,1'b0}: begin q=1;qb=~q; end
        {1'b1,1'b1}: begin q=~q;qb=~q; end
      endcase
endmodule
