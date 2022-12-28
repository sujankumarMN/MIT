module divide_by_2(clk,a,b);
  input clk;
  output a,b;
  reg a,b;
  initial begin a=1'b0; b=1'b0; end
  always @(posedge clk)
    a=~a;
  always @(posedge a)
    b=~b;
endmodule

module divide_by_2_tb();
  reg clk;
  wire a,b;
  divide_by_2 dut(.*);
  initial clk=1'b0;
  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
endmodule
  
