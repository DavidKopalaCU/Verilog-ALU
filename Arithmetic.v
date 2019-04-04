//module half_adder (
//	input 	x,
//	input		y,
//	
//	output	s,
//	output	c
//);
//
//assign s = x ^ y;
//assign c = x & y;
//
//endmodule


// Adapted from "Fundamentals of Digital Logic"
// Page 154, Figure 3.20
module full_adder (
	input 	x,
	input 	y,
	input		c_in,
	
	output	c_out,
	output	s_out
);

	assign s_out = x ^ y ^ c_in;
	assign c_out = (x & y) | (x & c_in) | (y & c_in);

endmodule


module ripple_carry_adder (x, y, result, carry);
////////////// REGION: PORTS
	parameter n = 4;	// Number of bits in adder

	input		[n-1:0]		x;
	input		[n-1:0]		y;

	output	[n-1:0]		result;
	output				carry;
////////////// ENDREGION: PORTS

////////////// REGION: INITIAL VALUES
	wire [n:0] C;
	assign C[0] = 1'd0;
////////////// ENDREGION: INITIAL VALUES

////////////// REGION: STRUCTURAL LOGIC
	genvar i;
	generate
		for (i = 0; i < n; i = i + 1)
			begin : gen1
				full_adder f_a(x[i], y[i], C[i], C[i+1], result[i]);
			end
	//	end for
	endgenerate
////////////// ENDREGION: STRUCTURAL LOGIC

////////////// REGION: CLEANUP/RESULTS
	assign carry = C[n];
////////////// ENDREGION: CLEANUP/RESULTS

endmodule



// QUESTIONS:
//		1) What exactly is a full subtractor circuit? Opposite of full adder?
//		2) If We have to use integer statements, why do we need a full subtractor?
module subtract(x, y, result);
////////////// REGION: PORTS
	parameter n = 4;
	input		[n-1:0]	x;
	input		[n-1:0]	y;
	output	[n-1:0]	result;
////////////// ENDREGION: PORTS

//reg neg_y = -y;
wire catty_out;
ripple_carry_adder adder(-x, y, result, carry_out);

endmodule



module multiply_by_2(
	input		[7:0]	x,
	output	[7:0] y,
	output			c
);

assign y = x << 1;
assign c = x[7];

endmodule



module divide_by_2(
	input		[7:0]	x,
	output	[7:0] y,
	output			c
);

assign y = x >> 1;
assign c = x[0];

endmodule



module multiply (a, b, out);

////////////// REGION: PORTS
	parameter n = 3;	// Bits in first number
	parameter m = 8;	// Bits in second number

	input [n-1:0] a;
	input [m-1:0] b;
	output [n+m-1:0] out;
////////////// ENDREGION: PORTS

// Store previous partial products
wire [n * (m + 1):0] inter;

// Set first partial product to zero
genvar f;
generate

	for (f = 0; f < n; f = f + 1)
	begin: for_zeros
	
		assign inter[f] = 1'b0;
		
	end //for_zeros

endgenerate
	
genvar i;
genvar j;
generate

	// For every bit in the second number
	for (i = 0; i < m; i = i + 1)
	begin: for_1
		
		wire [n:0] carries;
		assign carries[0] = 1'b0;
//		assign inter[(i + 2) * n - 1] = 1'b0;
		
		// The mult with the first bit will be assigned to the output
		wire and_add_first;
		and(and_add_first, b[i], a[0]);
		full_adder out_add(inter[(i * n)], and_add_first, carries[0], carries[1], out[i]);
		
		// For every bit in the first number
		for (j = 1; j < n; j = j + 1)
		begin: for_2
		
			// Multiply each bit in the first number by the bit in the second number
			wire and_add;
			and(wire_add, a[j], b[i]);
			
			// Add the partial product to the previous partial product
				// INPUTS
				// inter[i*n + j] - the previous partial product
					// i*n	- the "row" in the table
					// j 		- the column in the table
				// wire_add - output from the multiplication of this step
				// carries[j]	- the previous carry
				
				// OUTPUTS
				//	carries[j+1] - the next carry
				// inter[((i + 1) * n + j + 1] - The next partial product
					// (i + 1) * n - The next row in the table
					// j				- The column of that row
			full_adder full_add(inter[(i * n) + j], wire_add, carries[j], carries[j+1], inter[((i + 1) * n) + j - 1]);
		
		end // for_2
		
		assign inter[(i + 2) * n - 1] = carries[n];
		
	end // for_1

endgenerate

genvar t;
generate

	for (t = 0; t < n; t = t + 1)
	begin: conn
		assign out[(n+m-1)-t] = inter[(m * n - 1 + n - t)];
	end // conn
	
endgenerate

endmodule



