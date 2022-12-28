module mux2_1(input i0,i1,s,output out);
logic i0,i1,s;
logic out;
always @(*) begin
if(!s)
 out= i0;
 else 
 out= i1;

end
endmodule
