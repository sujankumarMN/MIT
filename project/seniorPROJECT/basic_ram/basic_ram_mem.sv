module basic_ram_mem(cs,clk,we,oe,addr,datain1,datain2,dataout1,dataout2);
 input cs,clk,we,oe;
 //reg [3:0]addr[1:0];
 output reg [3:0]addr[31:0];
 input [3:0]datain1,datain2;
 output reg [3:0]dataout1,dataout2;
 always@(posedge clk)
  begin
   if(cs!=0 && we == 1)
    //begin addr[0]=datain1;
begin addr[0]=datain1;
    addr[1]=datain2; end
   if(cs!=0 && we == 0 && oe == 1)
    begin dataout1=addr[0];
    dataout2=addr[1]; end

  end
endmodule

 
