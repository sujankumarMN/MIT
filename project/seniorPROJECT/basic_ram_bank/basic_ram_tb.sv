module basic_ram_tb();
 reg cs,clk,we,oe;
  reg [1:0]addr_row,addr_col;
 reg [3:0]datain;
 wire [3:0]dataout;
 wire [3:0]mem[3:0][3:0];
 basic_ram dut(.*);
 initial clk=1'b0;
 always #5 clk=~clk;
 initial begin
 cs=0; we=0; oe=0; #12;
 cs=0; we=1; oe=0; datain=3'b110; addr_row=2'b11;addr_col=2'b01; #13;
 cs=1; we=1; oe=0; #15;
 cs=1; we=0; oe=0; #10;
 cs=1; we=0; oe=1; #10;
 end
 initial begin
 
 $dumpfile("dump.vcd");
 $dumpvars();
 #100 $finish;
 end
endmodule


