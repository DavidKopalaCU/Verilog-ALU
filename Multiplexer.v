
module arithmetic_mux(
	input		[1:0]		a,
	
	//////////// LED //////////
	input				  [9:0]		in,
	
	
	//////////// SW //////////
	output 		reg     [9:0]		out
);

wire [4:0] adder_out;
ripple_carry_adder adder(in[3:0], in[7:4], adder_out[3:0], adder_out[4]);

wire [3:0] sub_out;
subtract	sub(in[3:0], in[7:4], sub_out[3:0]);

wire [8:0] mult_out;
multiply_by_2 m2(in[7:0], mult_out[7:0], mult_out[8]);

wire [8:0] div_out;
divide_by_2 d2(in[7:0], div_out[7:0], div_out[8]);

always @(a)
	case(a)
		0: begin
				out[3:0] <= adder_out[3:0];
				out[9]	<= adder_out[4];
			end
		1: out <= sub_out;
		2: begin
				out[7:0] <= mult_out[7:0];
				out[9]	<= mult_out[8];
			end
		3: begin
				out[7:0] <= div_out[7:0];
				out[9]	<= div_out[8];
			end
	
	endcase

endmodule



module logical_mux(
	input			[1:0]		a,
	
	input			[9:0]		in,
	output 	reg	[9:0]		out
);

wire [3:0] and_out;
m_and ad(in[3:0], in[7:4], and_out[3:0]);

wire [3:0] or_out;
m_or o(in[3:0], in[7:4], or_out[3:0]);

wire [3:0] x_out;
m_xor x(in[3:0], in[7:4], x_out[3:0]);

wire [7:0] not_out;
m_not n(in[7:0], not_out[7:0]);

always @(a)
	case (a)
		0: out <= and_out;
		1: out <= or_out;
		2: out <= x_out;
		3: out <= not_out;
	endcase

endmodule



module comparison_mux(
	input			[1:0]		a,
	
	input			[9:0]		in,
	output 	reg	[9:0]		out
);

wire eq_out;
equal eq(in[3:0], in[7:4], eq_out);

wire gt_out;
greater_than gt(in[3:0], in[7:4], gt_out);

wire lt_out;
less_than lt(in[3:0], in[7:4], lt_out);

wire [3:0] max_out;
max max_m(in[3:0], in[7:4], max_out);

always @(a)
	case(a)
		0: out <= eq_out;
		1: out <= gt_out;
		2: out <= lt_out;
		3: out <= max_out;
	
	endcase

endmodule



//module magic_mux(
//	input				[31:0]	clk_cnt,
//	output	reg	[9:0]		out
//);
//
//magic_mode mm(
//	clk_cnt,
//	out
//);
//
//endmodule



module main(
	input		[1:0]		a,
	input		[1:0]		b,
	
	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	
	//////////// LED //////////
	output 			reg     [9:0]		LEDR,
	
	
	//////////// SW //////////
	input 		     [9:0]		SW,
	
	input			[31:0] clk_cnt
);

wire [9:0] am_out;
arithmetic_mux am(b, SW, am_out);

wire [9:0] log_out;
logical_mux lm(b, SW, log_out);

wire [9:0] comp_out;
comparison_mux cm(b, SW, comp_out);

wire [9:0] magic_out;
magic_mode mm_mux(clk_cnt, magic_out);

wire [3:0] hex1_in;
wire [3:0] hex2_in;

seven_segment s1(hex1_in, 0, HEX0);
seven_segment s2(hex2_in, 0, HEX1);

assign hex1_in = LEDR[7:4];
assign hex2_in = LEDR[3:0];

always @(a, b)
	case (a)
		0: LEDR <= am_out;
		1: LEDR <= log_out;
		2: LEDR <= comp_out;
		3: LEDR <= magic_out;
		
	endcase
	
endmodule

