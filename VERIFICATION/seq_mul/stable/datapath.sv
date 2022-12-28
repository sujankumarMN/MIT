/*
module regA(input A,loadA,clk,output P);
	logic [2:0]A;
	logic [2:0]P;
	logic loadA;
	always @(posedge clk)
		begin
		if(loadA)
			P<=A;
		end
endmodule

module regB(input B,loadB,decB,clk,output Q);
	logic [2:0]B;
	logic [2:0]Q;
	logic loadB,decB;
	always @(posedge clk)
		begin
			if(loadB == 1'b0 && decB == 1'b1)
			begin
				if(Q==1'b0)
						Q<=B;
				else
						Q<=Q-1;
			end
			else if(loadB == 1'b1 && decB == 1'b0)
				Q<=B;
		end
endmodule
*/

module accumulator(input P,clk,decB, output product)
	logic [2:0]P;
	logic [5:0]product;
	logic decB;
	always @(posedge clk)
	begin
		if(!decB)
			product<=0;
		else
			product=product+P;
	end
	
endmodule

