program count_env(counter_interface cont_intt);
		
	initial begin
		//if($test$plusargs("reset"))
			//begin reset=1'b1; end
		if($test$plusargs("up_count"))
			begin cont_intt.load_en=1'b0; cont_intt.count_en=1'b1; end
		else if($test$plusargs("down_count"))
			begin cont_intt.load_en=1'b0; cont_intt.count_en=1'b0; end
		
	end
	
	
endprogram
	
