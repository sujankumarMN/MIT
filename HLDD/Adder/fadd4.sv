module fadd4(a,b,cin,sum,cout);
 input[3:0] a,b;
 input cin;
 output[3:0] sum;
 output cout;
 wire[2:0] temp_cout;
 fadd f1(a[0],b[0],cin,sum[0],temp_cout[0]);
 fadd f2(a[1],b[1],temp_cout[0],sum[1],temp_cout[1]);
 fadd f3(a[2],b[2],temp_cout[1],sum[2],temp_cout[2]);
 fadd f4(a[3],b[3],temp_cout[2],sum[3],cout);


endmodule


