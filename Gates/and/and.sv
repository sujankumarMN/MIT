module and_gate(input a,b, output reg y);
	always @(a,b)
	begin
		if(a==1'b1 && b==1'b1)
			#1 y =1'b1;
		else
			#1 y =1'b0;
	end
endmodule
