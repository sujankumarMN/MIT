module multiplier (inter r);
  always@(posedge r.clk)
    begin
      //when reset is high output is not ready for displaying result and p is made zero
      if(r.rst==1'b1)
        begin
         r.op_ready=1'b0;
         r.p=8'b0000_0000;
         r.product=8'b0000_0000; 
        end
      //when reset is low and load is high, A and B values are loaded and multiplication is performed and product is stored in the variable p.
      if(r.rst==1'b0 && r.load==1'b1)
        begin
          r.p=8'b0000_0000; //initially p is 0
          for(int i=0;i<4;i++) //iterating through all 4 bits of A
          begin
            if(r.a[i]==1) // if a bit of A is 1 then, temp is left shifted i times and stored in temp_b
            begin
              r.temp_b=r.temp<<i;
              r.p=r.p+r.temp_b; //successive addition is performed after each shift
              if(i==3) 
                r.op_ready=1'b1;//making op_ready flag 1 as we have final product which can be displayed.
            end
          end
        end
      //if(op_ready==1'b1)
        r.product=r.p; //p is assigned to product and product is observed in GUI
    end 
endmodule
      
        
      
        
