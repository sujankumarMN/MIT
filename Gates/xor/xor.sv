module xor_gate(input a,b, output reg y);
	always @(a,b)
	begin
		if(a!=b)
			y =1'b1;
		else
			y =1'b0;
	end
endmodule
