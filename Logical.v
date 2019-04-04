module m_and(
	input			[3:0]		x,
	input			[3:0]		y,
	output 		[3:0]		out
);

//genvar i;
//generate
//	
//	for (i = 0; i < 4; i = i + 1)
//	begin: for_1
//	
////		assign out[i] = x[i] & y[i];
//		and(out[i], x[i], y[i]);
//	
//	end // for
//	
//endgenerate

assign out[3] = x[3] & y[3];
assign out[2] = x[2] & y[2];
assign out[1] = x[1] & y[1];
assign out[0] = x[0] & y[0];

endmodule


module m_or(
	input		[3:0]		x,
	input		[3:0]		y,
	output	[3:0]		out
);

genvar i;
generate
	
	for (i = 0; i < 4; i = i + 1)
	begin: f
		
		assign out[i] = x[i] | y[i];
		
	end // for
	
endgenerate

endmodule


module m_xor(
	input		[3:0]		x,
	input		[3:0]		y,
	output	[3:0]		out
);

genvar i;
generate

	for (i = 0; i < 4; i = i + 1)
	begin: f
		
		assign out[i] = x[i] ^ y[i];
		
	end // f

endgenerate

endmodule


module m_not(
	input		[7:0]		in,
	output	[7:0]		out
);

genvar i;
generate

	for (i = 0; i < 8; i = i + 1)
	begin: f
		
		assign out[i] = !in[i];
		
	end // f

endgenerate

endmodule
