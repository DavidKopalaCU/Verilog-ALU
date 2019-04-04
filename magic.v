module magic_mode (
	input				[31:0]	clk_cnt,
	output		reg [9:0]		leds
);

reg dir;

always @(posedge clk_cnt[20])
begin

//	leds <= ~leds;

	if (leds == 0)
	begin: leds_0
	
		leds <= 1;
//		dir <= !dir;
	
	end // leds_0
	
	else
	begin: else_leds_0
	
		if (dir == 1)
		begin: dir_1
			
			leds = leds >> 1;
		
		end // dir_1
		
		else
		begin: dir_0
		
			leds = leds << 1;
		
		end // dir_0
		
		if (leds == 1 || leds == 10'b1000000000)
		begin: end_case
		
			dir = !dir;
		
		end
	
	end // else_leds_0
	
end

//assign leds = clk_cnt[31:22];

//reg dir;

//always @(clk_cnt)
//begin

//	leds <= 10'b1111111111;
//	leds <= !leds;

//	if (clk_cnt % 10000 == 0)
//	begin: if_1
//	
//		if (dir == 0)
//		begin: if_dir
//			
//			leds <= leds << 1;
//		
//		end // if_dir
//			
//		else
//		begin: else_dir
//		
//			leds <= leds >> 1;
//		
//		end // else_dir
//		
//		if (leds == 0)
//		begin: if_leds
//			
//			dir <= !dir;
//			
//		end // if_leds
//	
//	end // if

//end // always

endmodule
