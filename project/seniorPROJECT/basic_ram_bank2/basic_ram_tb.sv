module basic_ram_tb();
 reg cs,clk,we,oe;
 reg [1:0]addr_row,addr_col,bank_selector;
 reg [3:0]datain;
 wire [3:0]dataout;
 wire [3:0]mem1[3:0][3:0];
 wire [3:0]mem2[3:0][3:0];
 basic_ram dut(.*);
 initial clk=1'b0;
 always #5 clk=~clk;
 initial begin
	 cs=0; we=0; oe=0; bank_selector=1'b1;#5; 
 	 cs=0; we=0; oe=1; #12;
 	 cs=0; we=1; oe=0; #5;
 	 cs=0; we=1; oe=1; datain=4'b1000; #5;
	 cs=1; we=0; oe=0; #5
	 cs=1; we=0; oe=1; #10;
	 cs=1; we=1; oe=0; #13;
 	 cs=1; we=1; oe=0; addr_row=2'b11;addr_col=2'b01; #13;
 	 cs=1; we=1; oe=1; #10;
	 cs=1; we=0; oe=0; #10;
	 cs=1; we=0; oe=1; #10;
	 cs=1; we=1; oe=0;datain=4'b1011; bank_selector=1'b0;addr_row=4'b1111;addr_col=4'b1111; #13;
         cs=1; we=0; oe=1; #10; 

	 
	 //bank_selector=1'b0;datain=4'b1110; addr_row=2'b00;addr_col=2'b11;#15;
	 cs=1; we=0; oe=0; #10;
	 cs=1; we=0; oe=1; #10;
 end
 initial begin
	 
	 $dumpfile("dump.vcd");
	 $dumpvars();
	 #200 $finish;
 end
endmodule


