module data_path(input clk,A,B,loadA,loadB,decB,loadF,clear,output zero,product);
	logic [1:0]A;
	logic [1:0]B;
	logic [3:0]product;
	logic loadA,loadB,decB,loadF,clear,zero;
	logic [1:0]P;
	logic [1:0]Q;
	regA r1(A,loadA,clk,P);
	regB r2(B,loadB,decB,clk,Q);
	regF r3(P,loadF,decB,clk,product);
	comparator r4(Q,clk,zero);
	
endmodule
	
module regA(input A,loadA,clk,output P);
	logic [1:0]A;
	logic [1:0]P;
	logic clk,loadA;	
	always@(posedge clk)
	begin
		if(loadA)
			 P=A;
	end
endmodule


module regB(input B,loadB,decB,clk,output Q);
	logic [1:0]B;
	logic [1:0]Q;
	logic clk,loadB,decB;
	always@(posedge clk)
	begin
		if(loadB==1'b1 && decB == 1'b0)
			 Q=B-1;
		else if(loadB==1'b0 && decB == 1'b1)
		begin
          if(Q==0)
            Q=B;
          else
              Q=Q-1;
        end
	end
endmodule

module regF(input P,loadF,decB,clk,output product);
	logic [1:0]P,Q;
	logic [3:0]product;
	logic loadF,clear,clk;
	
	always @(posedge clk)
	begin
		if(!decB)
			product=0;
		else
			//if(Q==0)
			//	product=0;
			//else
			product=product+P;
	end
endmodule

module comparator(input B,clk,output zero);
	logic [1:0]B;
	logic zero;
	always @( B)
	if(B==1'b0)
		zero=1;
	else
		zero=0;
endmodule
		


