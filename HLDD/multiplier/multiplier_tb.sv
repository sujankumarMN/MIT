module multiplier_tb();
  logic [3:0]a,b;
  logic load,rst,clk;
  logic op_ready;
  logic [7:0]product,temp,temp_b,p;
  multiplier dut(.*);
  initial clk=1'b0;
  always #5 clk=~clk; //clock is pulsating for every 5ns

    initial begin
      rst=1'b0;a=4'b1000; b=4'b0011; #10; //A=8,B=3 input combination with no load signal
      load=1; #10; //load signal is enabled	
      rst=1'b1; #10;//reset is enabled, product will get reset
      
      rst=1'b0; a=4'b0010; b=4'b1011; #10; //A=10,B=11 input combination with no load signal
      load=1; #10;	
      rst=1'b1; #10;
      
       rst=1'b0; a=4'b1111; b=4'b1111; #10;//A=15,B=15 input combination with no load signal
      load=1; #10;	
      rst=1'b1; #10;
 end
  initial begin
   
    $dumpfile("test.vcd");
    $dumpvars;
     #180 $finish;
  end
endmodule
    
    
  
