// Code your design here
module counter(clk,rst,up,count);
  input up,clk,rst;
  output [3:0]count;
  reg [3:0]count;
  initial count = 4'b0000;
  always @(posedge clk)
    if(up)
      begin
        if(rst==1'b1)
          count=4'b0000;
        else
          count=count+1;
      end
  	else
       begin
        if(rst==1'b1)
          count=4'b1111;
        else
          count=count-1;
       end
endmodule
    

module counter_tb();
  reg up,clk,rst;
  wire  [3:0]count;
  counter dut(.*);
  initial clk=1'b0;
  always #5 clk=~clk;
  initial begin

    rst=1'b1;up=0;
    #15 rst=1'b0;
    #61 up=1;rst=1'b1;
    #64 rst=1'b0;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #200 $finish;
  end
endmodule
