module counterr(cont_int r);
	initial r.sys_out=8'b0000_0000;
	always @(posedge r.clk)
	begin
		if(r.reset==1'b1)
			r.sys_out=8'b0000_0000;
		else if(r.load_en==1'b1 && r.count_en==1'b0)
			r.sys_out=r.data;
		else if(r.load_en==1'b0 && r.count_en==1'b1)
			begin
				r.sys_out=r.sys_out+1;
				if(r.sys_out==8'b1111_1111)
					r.sys_out=8'b0000_0000;
				
			end
		else if(r.load_en==1'b0 && r.count_en==1'b0)
			begin
				r.sys_out=r.sys_out-1;
				if(r.sys_out==8'b0000_0000)
					r.sys_out=8'b1111_1111;
			end
		if(r.sys_out%2==0)
			r.out_even=1'b1;
		else
			r.out_even=1'b0;
	end
endmodule
