// Code your design here
module dff(clk,d,q);
  input clk,d;
  output q;
  reg q;
  always @(posedge clk)
   q<=d;
endmodule

// Code your testbench here
// or browse Examples
module test_dff();
  reg clk,d;
  wire q;
  dff dut(.*);
  initial clk=1'b0;
  always
   #5 clk=~clk;
  initial begin
    d=1'b0;
    #11 d=1'b1; 
    #8 d=1'b0;
    #7 d=1'b1;
    #4 d=1'b1;
    #4 d=1'b1;
    #4 d=1'b0;
    #7 d=1'b1;
    
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #50 $finish;
  end
endmodule

