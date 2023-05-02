class birds;
	int size=20;
	int life=10;
	string color="brown";
	
	function get_properties();
		$display(size,life,color);
	endfunction
endclass

class parrot extends birds;
	string color="green";
	function get_properties();
		$display(size,life,color);
	endfunction
endclass

module a;
	birds b;
	parrot p;
	initial begin
		p=new();
		b=p;
		p.get_properties;
		b.get_properties;
	end
endmodule
