class base;
	protected int i;
	
endclass
class ext extends base;
	function new();
		i=10;
	endfunction
endclass

program main;
	initial begin
		//base b=new();
		//b.set(123);
		ext e=new();
		$display(e.i);
		//$display(b.i);
	end
endprogram
