module FA_tb();
 reg [3:0]a,b;
 reg cin;
 wire [3:0]sum;
 wire cout;
 four_bit dut(.*);
 initial begin
 a=4'b1010;b=4'b0001;cin=1;#5;
 a=4'b1000;b=4'b0010;cin=1;#5;
 a=4'b1111;b=4'b0001;cin=1;#5;
 a=4'b1001;b=4'b1001;cin=1;#5;
 end
 initial begin
 $dumpfile("test.vcd");
 $dumpvars();
 end
endmodule

