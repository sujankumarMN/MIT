class birds;
	int size=20;
	int life=10;
	string color="brown";
	
	virtual function get_properties();
		$display(size,life,color);
	endfunction
endclass

class parrot extends birds;
	string color="green";
	virtual function get_properties();
		$display(size,life,color);
	endfunction
endclass

class m_parrot extends parrot;
	string color="multi";
	virtual function get_properties();
		$display(size,life,color);
	endfunction
endclass

module a;
	birds b;
	parrot p;
	m_parrot m;
	initial begin
		m=new();
		//p=m;
		b=m;
		//p.get_properties;
		b.get_properties;
	end
endmodule
