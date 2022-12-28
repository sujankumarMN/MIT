module basic_ram(cs,clk,we,oe,addr,datain,dataout);
 input cs,clk,we,oe;
 output reg [3:0]addr;
 input [3:0]datain;
 output reg [3:0]dataout;
 always@(posedge clk)
  begin
   if(cs!=0 && we == 1)
    addr=datain;
   if(cs!=0 && we == 0 && oe == 1)
    dataout=addr;
  end
endmodule

 
