module basic_ram_tb();
 reg cs,clk,we,oe;
 wire [3:0]addr[1:0];
//wire [3:0]addr1,addr2;
 reg [3:0]datain1,datain2;
 wire [3:0]dataout1,dataout2;
 basic_ram_mem dut(.*);
 initial clk=1'b0;
 always #5 clk=~clk;
 initial begin
 cs=0; we=0; oe=0; #12;
 cs=0; we=1; oe=0; datain1=4'b1011; #13;
 cs=1; we=1; oe=0; #15;
 cs=1; we=0; oe=0; #10;
cs=0; we=1; oe=0;  #10;
cs=1; we=1; oe=0; #21;
cs=1; we=0; oe=1; #10;
cs=1; we=1; oe=0;datain2=4'b1011; #9;
 cs=1; we=0; oe=1; #10;
 end
 initial begin
 #120 $finish;
 $dumpfile("test.vcd");
 $dumpvars();
 end
endmodule

