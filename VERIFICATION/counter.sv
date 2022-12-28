module counter #(cwidth=`cwidth)(counter_if_r r);
	always_ff @(posedge r.clk)
	begin
		if(r.reset)
		 r.q<=0;
		else if(r.load == 1'b1)
		 r.q<=r.d;
		else if (r.en=1'b1)	
		 r.q=r.q +1;
		else
		 r.q<='hz;
	end
endmodule


