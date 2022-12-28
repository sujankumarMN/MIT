interface mul_interface (input bit clk,rst);	
  logic [3:0]a,b; 
  logic load;
  logic op_ready; //indicate whether multiplication is completed and ready for displaying result
  logic [7:0]product;
  reg [7:0]temp,temp_b,p;//temporary variables to store product of each bits
  assign temp={4'b0000,b}; //extending b to 8 bits
  modport multiplier(input a,b,load,rst,clk,output product,op_ready);
endinterface:mul_interface

