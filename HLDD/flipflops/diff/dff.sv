module test_d_ff();
 reg test_clk;
 reg test_d;
 wire test_q;
 d_ff dut(.clk(test_clk),.d(test_d),.q(test_q));
 initial begin
  test_clk=0;
  test_d=1;#5;
  test_clk=1;
  test_d=0;#5;
  test_clk=1;
  test_d=1;#5;
  test_clk=0;
  test_d=0;#5;
 end
endmodule

module d_ff(clk,d,q);
 input clk;
 input d;
 output q;
 reg q;
 always @(posedge clk)
  d=q;
endmodule
