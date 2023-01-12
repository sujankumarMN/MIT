module mux(input a,b,c,output y,abar,bbar,cbar);
	logic a,b,c,y;
	logic abar,bbar,cbar;
	/*
	assign abar=~a;
	assign bbar=~b;
	assign cbar=~c;
	
	
	assign y= (bbar*cbar)+(abar*cbar)+(a*b*c);
	*/
	always @(*)
	begin
	//initial begin
	if(a==0&&b==0&&c==0)
		y=1;
	else if(a==0&&b==1&&c==0)
		y=1;
	else if(a==1&&b==0&&c==0)
		y=1;
	else if(a==1&&b==1&&c==1)
		y=1;
	else
		y=0;	
	//end
	end
endmodule
