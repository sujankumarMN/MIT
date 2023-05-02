class base;
	int i;
endclass

program main;
	initial begin
		base b=new();
		b.i=123;
		$display(b.i);
	end
endprogram
