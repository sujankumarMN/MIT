
`include "uvm_macros.svh"	
module regA(input A,loadA,clk,output P);
	logic [3:0]A;
	logic [3:0]P;
	logic clk,loadA;	
	always@(posedge clk)
	begin
		if(loadA)
			 P<=A;
	end
endmodule


module regB(input B,loadB,decB,clk,output Q);
	logic [3:0]B;
	logic [3:0]Q;
	logic clk,loadB,decB;
	always@(posedge clk)
	begin
		if(B == 2'b0000)
			Q=0;
		else
		begin
			if(loadB==1'b1 && decB == 1'b0)
				 Q<=B-1;
			else if(loadB==1'b0 && decB == 1'b1)
			begin
		     // if(Q==0)
		        //Q<=B;
		      //else
		        Q<=Q-1;
		    end
		end
	end
endmodule

module regF(input P,loadF,decB,clk,output product);
	logic [3:0]P,Q;
	logic [7:0]product;
	logic loadF,clear,clk;
	
	always @(posedge clk)
	begin
		if(!decB)
			product<=0;
		else
			//if(Q==0)
				//product<=0;
			//else
			product<=product+P;
	end
endmodule

module comparator(input B,clk,output zero);
	logic [3:0]B;
	logic zero;
	always @( B)
	if(B==1'b0)
		zero<=1;
	else
		zero<=0;
endmodule
		
module data_path(mul_interface m);
	/*logic [1:0]m.A;
	logic [1:0]m.B;
	logic [3:0]m.product;
	logic m.loadA,m.loadB,m.decB,m.loadF,m.clear,m.zero;
	logic [1:0]P;
	logic [1:0]Q;*/
	import uvm_pkg::*;
	always @(posedge m.clk)
		//if(!if1.reset)
			`uvm_info("DUT ", $sformatf("A  = %h, B = %h, product = %d",m.A,m.B,m.product), UVM_MEDIUM)
	regA r1(m.A,m.loadA,m.clk,m.P);
	regB r2(m.B,m.loadB,m.decB,m.clk,m.Q);
	regF r3(m.P,m.loadF,m.decB,m.clk,m.product);
	comparator r4(m.Q,m.clk,m.zero);
	
endmodule

