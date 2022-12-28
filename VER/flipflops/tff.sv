module tff(clk,t,q,qb);
  input clk,t;
  output q,qb;
  reg q,qb;
  initial begin
    q=1'b0;
    qb=1'b1; 
  end
  always @(posedge clk)
    case({t})
      {1'b0}: begin q=q;qb=qb; end
      {1'b1}: begin q=~q;qb=~q; end
    endcase
endmodule

module t_tb();
  reg clk,t;
  wire q,qb;
  tff dut(.*);
  initial clk = 1'b0;
  always #5 clk = ~clk;
  initial begin
       t=1'b1;
   #5  t=1'b1;
   #9  t=1'b0;
   #4  t=1'b1;
   #2  t=1'b1;
   #10 t=1'b0;
   #3  t=1'b0;
   #7  t=1'b1;
   #9  t=1'b0;
   #4  t=1'b0;
   #10 t=1'b1;
  end
  initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    #100 $finish;
  end
  endmodule
