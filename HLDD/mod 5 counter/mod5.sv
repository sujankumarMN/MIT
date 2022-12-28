module mod5(input clk,rst,output q);
	logic clk,rst;
	logic [2:0]q;
	always @(posedge clk)
		
			if(rst==1'b1)
			  q=3'b000;
			else if(q==3'b101)
				q=3'b000;
			else
				q=q+1;
		
endmodule
		
	
