`timescale 1ps/1ps
module divide_by_3(input clk,rst,en,output q);
	logic [1:0]q;
	reg divider;
	logic clk,rst,en;
	initial  q<=2'b00;
	initial divider<=1'b0;
	always @(posedge clk)
	begin
		if(rst)
			q<=2'b00;
		else
		begin
			if(en)
			begin
				if(q==2)
					q<=0;
				else
				begin
					q=q+1;
					
				end
			end
		end
		
	end
	always @(posedge q[0])
	begin
	divider<=~divider;
	end
endmodule
	
