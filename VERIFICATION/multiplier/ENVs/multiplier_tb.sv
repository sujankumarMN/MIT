`include "package.sv"
import mul_package::*
`include "env.sv"
`include "mul_interface.sv"
`include "multiplier.sv"

module multiplier_tb();
 bit rst,clk;
 initial begin clk=1'b0; rst=1'b0; end
 always #5 clk=~clk;
 mul_interface inter(clk,rst);
 multiplier dut(inter);
 mul_env(inter);
 initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    #180 $finish;
 end
endmodule
    
    
  
