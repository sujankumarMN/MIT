module or_gate(input a,b, output reg y);
	always @(a,b)
	begin
		if(a==1'b0 && b==1'b0)
			y =1'b0;
		else
			y =1'b1;
	end
endmodule
