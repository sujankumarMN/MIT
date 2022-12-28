module encoder(input y3,y2,y1,y0,output a1,a0);
	logic y3,y2,y1,y0;
	logic a1,a0;
	
		always @(*) begin
		case({y3,y2,y1,y0}) 
			4'b0001: begin a1=1'b0; a0=1'b0; end
			4'b0010: begin a1=1'b0; a0=1'b1; end
			4'b0100: begin a1=1'b1; a0=1'b0; end
			4'b1000: begin a1=1'b1; a0=1'b1; end
			default:  begin a1=1'b0; a0=1'b0; end
		endcase
	end
endmodule
			
