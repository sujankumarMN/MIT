module test_fadd();
 reg test_a,test_b,test_cin;
 wire test_sum,test_cout;
 fadd dut(.a(test_a),.b(test_b),.cin(test_cin),.sum(test_sum),.cout(test_cout));
 initial begin
 test_a=1'b0;
 test_b=1'b0;
 test_cin=1'b0;#5;
 test_a=1'b0;
 test_b=1'b0;
 test_cin=1'b1;#5;
 test_a=1'b0;
 test_b=1'b1;
 test_cin=1'b0;#5;
 test_a=1'b0;
 test_b=1'b1;
 test_cin=1'b1;#5;
 test_a=1'b1;
 test_b=1'b0;
 test_cin=1'b0;#5;
 test_a=1'b1;
 test_b=1'b0;
 test_cin=1'b1;#5;
 test_a=1'b1;
 test_b=1'b1;
 test_cin=1'b0;#5;
 test_a=1'b1;
 test_b=1'b1;
 test_cin=1'b1;#5;
 end
 initial begin
  $monitor($time,"a=%b,b=%b,cin=%b,sum=%b,cout=%b",test_a,test_b,test_cin,test_sum,test_cout);
  $dumpvars;
  $dumpfile("test.vcd");
 end
endmodule
