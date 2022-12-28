`timescale 1ns/1ps
module clock(ck_c, ck_t, cke);
	output logic ck_c;
	output logic ck_t;
	input logic cke;
	
	initial begin
		ck_c = 0;
		ck_t = 1;

	end
	always
		begin
			if(cke == 1'b1)
				begin
					#5 ck_c = ~ck_c;
					ck_t = ~ck_t;		
				end
			else
			begin
					#5 ck_c = ck_c;
					ck_t = ck_t;
			end
		end

endmodule
