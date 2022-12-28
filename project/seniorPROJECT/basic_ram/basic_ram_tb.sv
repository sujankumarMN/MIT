module basic_ram_tb();
 reg cs,clk,we,oe;
 wire [3:0]addr;
 reg [3:0]datain;
 wire [3:0]dataout;
 basic_ram dut(.*);
 initial clk=1'b0;
 always #5 clk=~clk;
 initial begin
 cs=0; we=0; oe=0; #12;
 cs=0; we=1; oe=0; datain=4'b1011; #13;
 cs=1; we=1; oe=0; #15;
 cs=1; we=0; oe=0; #10;
 cs=1; we=0; oe=1; #10;
 end
 initial begin
 #100 $finish;
 $dumpfile("test.vcd");
 $dumpvars();
 end
endmodule

