module FA_tb();
 reg a,b,c;
 wire sum,cout;
 FA dut(.*);
 initial begin
  a=1'b0;b=1'b0;c=1'b0;#5;
  a=1'b0;b=1'b0;c=1'b1;#5;
  a=1'b0;b=1'b1;c=1'b0;#5;
  a=1'b0;b=1'b1;c=1'b1;#5;
  a=1'b1;b=1'b0;c=1'b0;#5;
  a=1'b1;b=1'b0;c=1'b1;#5;
  a=1'b1;b=1'b1;c=1'b0;#5;
  a=1'b1;b=1'b1;c=1'b1;#5;
 end
 initial begin
 $dumpfile("test.vcd");
 $dumpvars();
 end
endmodule

