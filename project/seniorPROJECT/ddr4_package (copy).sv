
`ifndef DEFS_DONE
   `define DEFS_DONE

package ddr4_pkg;	

	

	parameter HIGH = 1'b1;
	parameter LOW = 1'b0;
	parameter VALID = 1'b1;
	parameter IDLE = 4'b0000;
	parameter ACTIVATE = 4'b0001;
	parameter INIT_mem = 4'b0010;
	parameter WRITE = 4'b0011;
	parameter WRITE_A = 4'b0100;
	parameter READ = 4'b0101;
	parameter READ_A = 4'b0110;
	parameter PRE = 4'b0111;
	parameter RESET = 4'b1000;
	parameter REFRESH = 4'b1001;	

	//logic [15:0] dq;		// data bus
	
	bit[3:0]present_state;
	bit [3:0] next_state;


	logic clear_counter;
	logic[31:0]refresh_counter;
	logic refresh_almost;
	logic refresh_rdy;
	logic refresh_done;
	logic clear_wait_counter;
	logic wait_done;
	logic[31:0] wait_counter;

	//timing parameter
   
   	parameter nCK      = 1.25;
  	parameter tRTP     = int'(7.5/nCK);
   	parameter tWTR     = int'(7.5/nCK);
   	parameter tWR      = int'(15/nCK);
  	parameter tRP      = int'(12.5/nCK);
   	parameter ACT_DELAY = int'(7.5/nCK);         //act to act cmds latency
   	parameter tRCD      = int'(12.5/nCK);
   	parameter CAS_DELAY = int'(12.5/nCK);        //act to cas cmd latency


   	//timming parameter for reset
   	parameter tCKE_L   = int'(500/nCK);
   	parameter tXPR     = 5;
   	parameter tMRD     = 8;
   	parameter tMOD     = 24;
   	parameter tZQ      = 4096;
   	parameter tIS      = 10;
   	parameter tRAS     = int'(25/nCK);            //act to precharge latency
   	parameter tREF     = int'(7800/nCK);          //7.8us
   	parameter tRC      = int'(47.5/nCK);                //refresh to act


endpackage      
import ddr4_pkg::*;
`endif 
