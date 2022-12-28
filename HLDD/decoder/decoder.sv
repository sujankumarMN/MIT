module decoder(input a1,a0,e,output y3,y2,y1,y0);
	logic a1,a0,e;
	logic y3,y2,y1,y0;
  
 	always @(a1,a0,e) begin
	if(e)
 		case({a1,a0})
 			2'b00: begin y0 = 1'b1; y1 = 1'b0; y2 = 1'b0; y3 = 1'b0; end
			2'b01: begin y0 = 1'b0; y1 = 1'b1; y2 = 1'b0; y3 = 1'b0; end
			2'b10: begin y0 = 1'b1; y1 = 1'b0; y2 = 1'b1; y3 = 1'b0; end
			2'b11: begin y0 = 1'b1; y1 = 1'b0; y2 = 1'b0; y3 = 1'b1; end
		endcase
	else
		begin y0 <= 1'bz; y1 <= 1'bz; y2 <= 1'bz; y3 <= 1'bz; end
end	
endmodule
 		
