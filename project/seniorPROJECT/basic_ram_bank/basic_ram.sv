
module basic_ram(cs,clk,we,oe,addr_row,addr_col,datain,dataout,mem);
 input cs,clk,we,oe;
 input [1:0]addr_row,addr_col;
 input [3:0]datain;
 output reg [3:0]dataout;
 output reg [3:0]mem[3:0][3:0];
 always@(posedge clk)
  begin
    if(cs!=0 && we == 1)
     mem[addr_row][addr_col]=datain;
   if(cs!=0 && we == 0 && oe == 1)
     dataout=mem[addr_row][addr_col];
  end
endmodule

 
