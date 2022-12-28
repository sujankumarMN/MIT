module jk(clk,j,k,q,qb);
  input clk,j,k;
  output q,qb;
  reg q,qb;
  always @(posedge clk)
      case({j,k})
        {1'b0,1'b0}: begin q=q;qb=qb; end
        {1'b0,1'b1}: begin q=0;qb=~q; end
        {1'b1,1'b0}: begin q=1;qb=~q; end
        {1'b1,1'b1}: begin q=~q;qb=~q; end
      endcase
endmodule

module jk_tb();
  reg clk,j,k;
  wire q,qb;
  jk dut(.*);
  initial clk =1'b0;
  always #5 clk=~clk;
  initial begin 
       j=1'b1;k=1'b0;
   #7  j=1'b1;k=1'b0;
   #9  j=1'b0;k=1'b1;
   #4  j=1'b0;k=1'b1;
   #2  j=1'b1;k=1'b1;
   #10 j=1'b1;k=1'b1;
   #3  j=1'b0;k=1'b1;
   #7  j=1'b0;k=1'b0;
   #9  j=1'b1;k=1'b0;
   #4  j=1'b1;k=1'b1;
   #10 j=1'b0;k=1'b1;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
