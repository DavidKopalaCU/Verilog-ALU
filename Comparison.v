module equal (
	input [3:0] x,
	input [3:0] y,
	output	reg	out
);

always @(x, y)
begin procedural:
	if (x == y)
	begin
		out <= 1;
	end // if
	
	else
	begin
		out <= 0;
	end // else
end // procedural

endmodule



module greater_than(
	input		[3:0]		x,
	input		[3:0]		y,
	output	reg		out
);

always @(x, y)
begin procedural:
	
	if (x > y)
	begin
		out <= 1;
	end // if
	
	else
	begin
		out <= 0;
	end // else
	
end // procedural

endmodule

module less_than(
	input		[3:0]		x,
	input		[3:0]		y,
	output	reg		out
);

always @(x, y)
begin procedural:
	
	if (x < y)
	begin
		out <= 1;
	end // if
	
	else
	begin
		out <= 0;
	end // else
		
	
end // procedural

endmodule


module max(
	input		[3:0] x,
	input 	[3:0] y,
	output reg	[3:0] out
);

always @(x, y)
begin

	if (x > y)
	begin
	
		out <= x;
	
	end
	
	else if(y > x)
	begin
	
		out <= y;
	
	end
	
	else
	begin
		
		out <= 0;
	
	end

end // always

endmodule

