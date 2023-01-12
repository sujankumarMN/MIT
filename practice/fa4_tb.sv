`include "fa.sv"
`include "fa4_interface.sv"

module fa4_tb();
	
	integer i,j,k;
	bit [3:0]expected;
	
	fa4_interface fint();
	fa4 dut(fint);
	
	initial begin

		for(i=0;i<16;i++)
		begin
			fint.a<=i;
			for(j=1;j<16;j++)
			begin
				fint.b<=5;
				for(k=0;k<2;k++)
				begin
				
					fint.cin<=k;
					#10
					expected=fint.a+fint.b+fint.cin;
					if(fint.sum!=expected)
					begin
						$display("a=%d b=%d c=%d",fint.a,fint.b,fint.cin);
						$display("THIS IS ERROR %d",expected);
						$stop;
					end
				end
			end
		end

	end
	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars;
		#1000 $finish;
	end
endmodule
		
		
		
	
