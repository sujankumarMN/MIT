module jk_tb();
  reg clk,j,k;
  wire q1,q2,q3,q1b,q2b,q3b;
  Acounter dut(.*);
  initial clk =1'b0;
  always #5 clk=~clk;
  initial begin 
      j=1'b1;k=1'b0;
   #7  j=1'b0;k=1'b1;
   
   #4  j=1'b1;k=1'b1;
  
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #80 $finish;
  end
endmodule
