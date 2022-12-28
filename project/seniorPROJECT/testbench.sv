`include "ddr4_package.pkg"
`timescale 1ns/1ps

module testbench;
	reg act_n; 		//activate signal
	reg reset_n;		// reset signal
	reg refresh;
	reg [15:0] data_in;
	reg[15:0] data_out;
	
	reg [19:0] Addr; //bank_group_select, [1:0] bank_select ,ras_n_a16, cas_n_a15, we_n_a14, a13, bc_n_a12, a11, ap_a10, a9_0;

	controller c1(.bank_group_select(Addr[19]),
	 .bank_select(Addr[18:17]), .ras_n_a16(Addr[16]),
	  .cas_n_a15(Addr[15]), .we_n_a14(Addr[14]), .a13(Addr[13]), .bc_n_a12(Addr[12]), .a11(Addr[11]), 
	  .ap_a10(Addr[10]), .a9_0(Addr[9:0]), .act_n(act_n), .reset_n(reset_n), .refresh(refresh),.row_addr(Addr[16:0]),.data_in(data_in),.data_out(data_out));


	initial begin
	$dumpfile("traces.vcd");
	$dumpvars();
	$timeformat(-9,2,"ns");
		 $monitor("[$monitor] Time = %0t, Present_State = %0h, Next_state = %0h ", $realtime, present_state, next_state); 

	 #10 reset_n = LOW; //RESET 

	#100 reset_n = HIGH; 

	#100 refresh = HIGH;  //REFRESH 

	#10 refresh = LOW;  
	Addr[19] = 0;  //bankgroup select
		Addr[18:17] = 2'b0; //bank_select
		Addr[16] = HIGH;  //ras
		Addr[15] = LOW; //cas (low during read write)
		Addr[12] = VALID;
		Addr[13] = VALID;//CS_N--SUJAN
		Addr[11] = VALID;
		Addr[10] = LOW;
	#50 act_n = LOW; //ACTIVATE
	Addr[15] = HIGH;
		Addr = 20' ; 	// bank 0_0 row 0     0001_0111_0000_0000_0010

	#10 act_n = HIGH; 
		Addr[14] = LOW; //WRITE 
		 Addr[9:0] = 10'b0000000010;					// col 0//----2col2row---
		data_in = 16'hff00;

	#400 act_n = HIGH; 
		Addr[14]= HIGH;		// switch to read mode		

	#50 act_n = LOW; //ACTIVATE
	#10 Addr[15] = HIGH;
	#10	Addr =  20'b10100000000000000000;		// bank 1_1 row 0


	#800 act_n = HIGH; 
		Addr[14] = LOW; //WRITE
		Addr[9:0] = 10'b0000000001;				// col 1
		dq = 16'bxxxx;
		data_in = 16'hafbc;


	#400 act_n = HIGH;
		 Addr[9:0] = 10'b0000000001;				//read from col 1 of bank 1_1 row 0
		Addr[14] = HIGH;		// switch to read mode


	#800 act_n = LOW; //ACTIVATE
		Addr[15] = HIGH;
		#10 Addr = 20'b000000000000000000000;		// bank 0_0 row 0

		//col 3
	#1200 act_n = HIGH; 
		Addr[14] = LOW; //WRITE 
		Addr[15] = LOW;	 	
		Addr[9:0] = 10'b0000000011;	
		
		data_in = 16'h7654;
	
	#400 act_n = HIGH;
		 Addr[9:0] = 10'b0000000011;				// read data from col 3 of bank 0_0 row 0
		Addr[14] = HIGH;							// switch to read mode


	#1200 act_n = LOW; //ACTIVATE
		Addr = 20'b10000000000000000000;		// bank 1_0 row 0
		
	#800 act_n = HIGH; 
	 Addr[15] = LOW;
		Addr[14] = LOW; //WRITE 
		Addr[9:0] = 10'b0000000011;				// col 3
		data_in = 16'h7654;
	

		#9000 $finish; 
	end
endmodule
