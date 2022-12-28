module test_fadd4();
 reg[3:0] a,b;
//reg clk;
 reg cin;
 wire[3:0] sum;
 wire cout;
 fadd4 dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
//initial  clk = 0;
//always #5 clk = ~clk; 

initial begin
     a=4'b0001;b=4'b0001;cin=1;
 #20 a=4'b0101;b=4'b1101;cin=0;
 #20 a=4'b1100;b=4'b1001;cin=1;

#100 $finish;
 end

endmodule

