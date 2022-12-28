module mux4_1(input i0,i1,i2,i3,s0,s1,output out);
logic i0,i1,i2,i3,s0,s1;
logic out;
always @(*) begin
case({s0,s1})
 2'b00: out = i0;
 2'b01: out = i1;
 2'b10: out = i2;
 2'b11: out = i3;
 default: out = 0;
endcase

end
endmodule
