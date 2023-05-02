class a;
	int a1 = 1;
	
	function new(int i);
		a1=2;
	endfunction
	
endclass

class b extends a;
	int b1=3;
	function new();
		//super.new(5);
		b1=a1;
	endfunction
endclass

module c();
	b bb;
	initial begin 
		bb=new();
		$display("ans=%d",bb.b1);
	end
endmodule
