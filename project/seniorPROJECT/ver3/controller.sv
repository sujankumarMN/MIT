                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    `include "ddr4_package.pkg"
 `timescale 1ns/1ps

	module controller(
	input logic bank_group_select,
	input logic[1:0] bank_select,
	input logic ras_n_a16, cas_n_a15, we_n_a14,
	input logic a13,
	input logic bc_n_a12,
	input logic a11,
	input logic ap_a10,
	input logic [9:0] a9_0,
	input logic act_n,	
	input logic reset_n,	
	input logic refresh,
	input logic[16:0] row_addr,
	input logic [15:0]data_in,
	output logic [15:0]data_out); 			// Row Address 	
	logic cs_n;	
	logic cke;		
	logic ck_t, ck_c;	
	
	logic[2:0] cur_bank, next_bank;

	logic bgs_temp;							//temporary variable to store bank group select
	logic [1:0] b_select_temp;
	bit flag;


	logic[15:0] bank0_0[7:0][7:0]; 		//2^17 rows , 2^10 cols storing 16 bit of data
	logic[15:0] bank0_1[7:0][7:0];
	logic[15:0] bank0_2[7:0][7:0];
	logic[15:0] bank0_3[7:0][7:0];
	logic[15:0] bank1_0[7:0][7:0];
	logic[15:0] bank1_1[7:0][7:0];
	logic[15:0] bank1_2[7:0][7:0];
	logic[15:0] bank1_3[7:0][7:0];

	logic[15:0] row_buffer[7:0]; // buffer to store row data after activate is issued (sense_Amps)
	clock clk1(ck_c, ck_t, cke);

	always_ff @(posedge ck_t)
	begin
	if(reset_n == LOW)
		present_state <= RESET; 
	else begin
		cur_bank <= next_bank;
		present_state <= next_state;
	end
	end


	always @(*)
	begin	
	next_bank = {bank_group_select, bank_select};
	if(refresh_almost)
		begin
			$display("Entered Refresh");
			next_state = REFRESH;
		end
	else if((cur_bank != next_bank) && (present_state == WRITE || present_state == READ)) 		// check if the next bank address is same as that of the previous one
	begin
		next_state = PRE;
		flag = 1'b1;
		//act_n = HIGH;
	end
	else begin
	case(present_state)

			IDLE: begin						//from IDLE state
				cs_n = LOW;
				cke = HIGH;
			if(act_n == LOW || flag == 1'b1)
				next_state = ACTIVATE;			// ACTIVATE
			else if(reset_n == LOW)
				next_state = RESET;			//RESET
			else if(refresh == HIGH)
				next_state = REFRESH;
			else
				next_state = IDLE;
				clear_counter = 1'b0;
				clear_wait_counter = 1'b1;
			end
/****************end of IDLE*************************/

			ACTIVATE: begin						//from ACTIVATE state
			bgs_temp = bank_group_select;
		 	b_select_temp = bank_select;
			flag = 1'b0;
			if(act_n == HIGH && we_n_a14 == LOW)
				begin
					if(ap_a10 == HIGH)
						next_state = WRITE_A; // WRITE_A
					else
						next_state = WRITE; // WRITE
				end
				if(act_n == HIGH && we_n_a14 == HIGH)
				begin
					if(ap_a10 == HIGH)
						next_state = READ_A; // READ_A
					else
						next_state = READ; // READ
				end
				if(reset_n == LOW)
					next_state = RESET;			//RESET
		
				case(bank_group_select)
					1'b0:
					begin
						case(bank_select)

							2'b00: 
							begin
								row_buffer = bank0_0[row_addr][7:0];
								//$display("address is: %0h\n",row_addr);
							end
							2'b01: row_buffer = bank0_1[row_addr][7:0];
							2'b10: row_buffer = bank0_2[row_addr][7:0];
							2'b11: row_buffer = bank0_3[row_addr][7:0];
						endcase
					end
					1'b1:
					begin
						case(bank_select)
							2'b00: row_buffer = bank1_0[row_addr][7:0];
							2'b01: begin
								$display("ACTIVATE bank1_1");
								row_buffer[7:0] = bank1_1[row_addr][7:0];
								end
							2'b10: row_buffer = bank1_2[row_addr][7:0];
							2'b11: row_buffer = bank1_3[row_addr][7:0];
						endcase
					end
				endcase
						
			end

/****************end of ACTIVATE*************************/
			INIT_mem: begin						//from INIT_mem state
						next_state = IDLE;			// IDLE state 
					end


/****************end of Init*************************/
			WRITE: begin						//from WRITE state
			if(we_n_a14 == LOW && cas_n_a15 == LOW)
				begin
				if(ap_a10 == HIGH)
					next_state = WRITE_A; // WRITE_A
				else
					begin	
						row_buffer[a9_0] = data_in;
						$display("In WRITE datain row buffer is %0h", row_buffer[a9_0]);
						clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = WRITE;
								end
					end
				end
				if(we_n_a14 == HIGH && cas_n_a15 == LOW)
					begin
						if(ap_a10 == HIGH) 
							begin
							clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = READ_A; // READ
								end
							end

						else
							begin
							clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = READ; // READ
								end
							end
							
					end
				if(reset_n == LOW)
					next_state = RESET;			//RESET
			end


/****************end of WRITE*************************/



			WRITE_A: begin						//from WRITE_A state
				if(reset_n == LOW)
					next_state = RESET;			//RESET
				else begin
					row_buffer[a9_0]=data_in;
					next_state = PRE;			// PRE state
				end
				end

/****************end of WRITE_A*************************/


			READ: begin						//from READ state
			if(we_n_a14 == LOW && cas_n_a15 == LOW)
				begin
					if(ap_a10 == HIGH)
						begin
							clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = WRITE_A; // WRITE_A
								end
							end
						
					else
						begin
							clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = WRITE; // WRITE
								end
							end

						
				end
					if(we_n_a14 == HIGH && cas_n_a15 == LOW)
						begin
							if(ap_a10 == HIGH)
								begin
							clear_wait_counter = 1'b0;
							if(wait_done)
								begin
									$display("entered wait_counter");
									next_state = READ_A; // READ_A
								end
							end
								
							else
								begin
									
									data_out=row_buffer[a9_0];
									$display("In READ datain row buffer is %0h", row_buffer[a9_0]);
										clear_wait_counter = 1'b0;
										if(wait_done)			
											next_state = READ; // READ
								end
						end
			if(reset_n == LOW)
				next_state = RESET;			//RESET
		end

/****************end of READ*************************/
			READ_A: begin						//from READ_A state
			if(reset_n == LOW)
				next_state = RESET;			//RESET
			else begin
				data_out=row_buffer[a9_0];
				next_state = PRE;			// PRE State
				end
			end

/****************end of READ_A*************************/
			PRE: begin						//from PRE state
			//$display("PRECHARGE!!!!!!!!!");
				case(bgs_temp)
							1'b0:
							begin
								//$display("bankgroup0");	
								case(b_select_temp)

									2'b00: 
									begin
										$display("PRECHARGE bank0_0");
										 bank0_0[row_addr][7:0] = row_buffer;
									end
									2'b01:  bank0_1[row_addr][7:0] = row_buffer;
									2'b10:  bank0_2[row_addr][7:0] = row_buffer;
									2'b11:  bank0_3[row_addr][7:0] = row_buffer;
								endcase
							end
							1'b1:
							begin
								case(b_select_temp)
									2'b00:  bank1_0[row_addr][7:0] = row_buffer;
									2'b01: begin
										$display("PRECHARGE bank1_1");
										 bank1_1[row_addr][7:0] = row_buffer;
										end
									2'b10:  bank1_2[row_addr][7:0] = row_buffer;
									2'b11:  bank1_3[row_addr][7:0] = row_buffer;
								endcase
							end
						endcase
						clear_wait_counter = 1'b0;
								if(wait_done)			
									next_state = IDLE; // IDLE
			end


/****************end of PRE*************************/

			RESET: begin						//from RESET state
					
					next_state = INIT_mem;			// INIT_mem state
					end

/****************end of RESET*************************/
			REFRESH: begin
						//$display("Refresh");
						cke = 1'b0;						//from REFRESH state

						clear_counter = 1'b1;
					if(refresh_done || refresh == LOW)
					begin
						cke = 1'b1;
						cs_n = 1'b1;
						next_state = IDLE;			// IDLE state
						
					end
					end

/****************end of REFRESH*************************/
		endcase
		end
end


		// Counters in the project
	 
    always_ff @(posedge ck_t)    //32ms
    begin
       if(clear_counter == 1'b1) begin
          refresh_counter      <= 0;
          refresh_almost       <= 1'b0;
          refresh_rdy   <= 1'b0;
          refresh_done         <= 1'b0;
          end
       else begin
          refresh_counter <= refresh_counter + 1;
          if (refresh_counter == tREF - 100) 
             refresh_almost <= 1'b1;
          else if (refresh_counter == (tREF -1)) begin
             refresh_almost <= 1'b0;
             refresh_rdy <= 1'b1;
          end   
          else if (refresh_counter == tREF) begin
              refresh_rdy <= 1'b0;   
             refresh_done <= 1'b1;
          end 
        end          
    end 

    //wait counter gives a delay of 390ns
     always @(posedge ck_t)
    begin
       if(clear_wait_counter == 1'b1) begin
          wait_done      <= 1'b0;
          wait_counter <= 0;
          end
       else begin
          wait_counter  <= wait_counter + 1;
          if (wait_counter == tRC) 
             wait_done  <= 1'b1;
       end                            
    end

endmodule
