module multiplier(input a,b,load,rst,clk,output product,op_ready);
  logic [3:0]a,b; 
  logic load,rst,clk;
  logic op_ready; //indicate whether multiplication is completed and ready for displaying result
  logic [7:0]product;
  
  reg [7:0]temp,temp_b,p;//temporary variables to store product of each bits
  assign temp={4'b0000,b}; //extending b to 8 bits
  always@(posedge clk)
    begin
      //when reset is high output is not ready for displaying result and p is made zero
      if(rst==1'b1)
        begin
         op_ready=1'b0;
         p=8'b0000_0000; 
	 product=8'b0000_0000; 
        end
      //when reset is low and load is high, A and B values are loaded and multiplication is performed and product is stored in the variable p.
      if(rst==1'b0 && load==1'b1)
        begin
          p=8'b0000_0000; //initially p is 0
          for(int i=0;i<4;i++) //iterating through all 4 bits of A
          begin
            if(a[i]==1) // if a bit of A is 1 then, temp is left shifted i times and stored in temp_b
            begin
              temp_b=temp<<i;
              p=p+temp_b; //successive addition is performed after each shift
              if(i==3) 
                op_ready=1'b1;//making op_ready flag 1 as we have final product which can be displayed.
            end
          end
        end
      //if(op_ready==1'b1)
        product=p; //p is assigned to product and product is observed in GUI
    end 
endmodule
      
        
      
        
