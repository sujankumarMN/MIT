module(input clk,zero,start,output loadA,loadB,decB);
	logic clk,zero,start,loadA,loadB,decB;
	typedef enum {s0,s1,s2,s3,s4} State;
	State state;
	always @(posedge clk)
	begin
		case(state)
			s0:  if(start) state=s1;
			s1:  state=s2;
			s2:  state=s3;
			s3:  if(zero) state=s4;
			s4:  state=s0;
			default: state=s0;
		endcase
	end
	always @(state)
	begin
		case(state)
				s0:  begin clear=1'b1; loadA=0; loadB=0; decB=0; end
				s1:  begin loadA=1;end
				s2:  begin loadA=0;loadB=1;end
				s3:  begin loadA=0;loadB=0;decB=1; end
				s4:  state=s0;
				default: state=s0;
		endcase
			  
