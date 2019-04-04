module equal (
	input [3:0] x,
	input [3:0] y,
	output 		out
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
