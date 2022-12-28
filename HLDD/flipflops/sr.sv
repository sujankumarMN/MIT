module sr(clk,s,r,q,qb);
  input clk,s,r;
  output q,qb;
  reg q,qb;
  always @(posedge clk)
    casez({s,r})
      {1'b0,1'b0}:begin q=q;qb=qb; end
      {1'b0,1'b1}:begin q=1'b0;qb=1'b1; end
      {1'b1,1'b0}:begin q=1'b1;qb=1'b0; end
      {1'b1,1'b1}:begin q=1'bZ;qb=1'bZ; end
    endcase
  
endmodule
  
// Code your testbench here
// or browse Examples
module sr_tb();
  reg clk,s,r;
  wire q,qb;
  sr dut(.*);
  initial clk =1'b0;
  always #5 clk=~clk;
  initial begin 
       s=1'b1;r=1'b0;
   #7  s=1'b1;r=1'b0;
   #9  s=1'b0;r=1'b1;
   #4  s=1'b0;r=1'b1;
   #2  s=1'b1;r=1'b1;
   #10 s=1'b1;r=1'b1;
   #3  s=1'b0;r=1'b1;
   #7  s=1'b0;r=1'b0;
   #9  s=1'b1;r=1'b0;
   #4  s=1'b1;r=1'b1;
   #10 s=1'b0;r=1'b1;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
