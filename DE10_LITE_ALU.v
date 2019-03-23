
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_LITE_ALU(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

//reg [3:0] x = 4'd1;
//reg [3:0] y = 4'd2;
//wire [3:0] out = { LEDR[3], LEDR[2], LEDR[1], LEDR[0] };
//wire carry_out = LEDR[4];

//ripple_carry_adder adder_1(4'd1, 4'd2, { LEDR[3], LEDR[2], LEDR[1], LEDR[0] }, LEDR[4] );
multiply_m m(SW[3:0], SW[7:4], LEDR[8:0]);

//$display({ LEDR[3], LEDR[2], LEDR[1], LEDR[0] });


//=======================================================
//  Structural coding
//=======================================================



endmodule
