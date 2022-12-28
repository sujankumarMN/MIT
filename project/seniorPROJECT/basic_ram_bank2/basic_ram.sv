
module basic_ram(cs,clk,we,oe,bank_selector,addr_row,addr_col,datain,dataout,mem1,mem2);
 input cs,clk,we,oe;
 input [1:0]addr_row,addr_col;
 input [3:0]datain;
 input [1:0]bank_selector;
 output reg [3:0]dataout;
 output reg  [3:0]mem1[3:0][3:0];
 output reg  [3:0]mem2[3:0][3:0];
 always@(posedge clk)
   
  begin
    if(cs!=0 && we == 1)
      case(bank_selector)
        1'b0:    mem1[addr_row][addr_col]=datain;
        1'b1:	 mem2[addr_row][addr_col]=datain;
        default: mem1[addr_row][addr_col]=datain;
      endcase
   
    if(cs!=0 && we == 0 && oe == 1)
     case(bank_selector)
        1'b0:     dataout=mem1[addr_row][addr_col];
        1'b1:     dataout=mem2[addr_row][addr_col];
        default:  dataout=mem2[addr_row][addr_col];
     endcase
     
  end
endmodule

 
