// Adapted From "Fundamentals of Digital Logic"
// Page 219, Figure 4.34
// DE10 Lite 7-Segment Display described in User Manual
//	Page 28, Section 3.4

module seven_segment (
	input				[3:0]	hex,
	input						dec,
	output	reg	[7:0] leds
);


always @(hex)
	case (hex)
		0: leds = { !dec, 7'b1000000 };
		1: leds = { !dec, 7'b1111001 };
		2: leds = { !dec, 7'b0100100 };
		3: leds = { !dec, 7'b0110000 };
		4: leds = { !dec, 7'b0011001 };
		5: leds = { !dec, 7'b0010010 };
		6: leds = { !dec, 7'b0000010 };
		7: leds = { !dec, 7'b1111000 };
		8: leds = { !dec, 7'b0000000 };
		9: leds = { !dec, 7'b0010000 };
		10: leds = { !dec, 7'b0001000 };
		11: leds = { !dec, 7'b0000011 };
		12: leds = { !dec, 7'b1000110 };
		13: leds = { !dec, 7'b0100001 };
		14: leds = { !dec, 7'b0000110 };
		15: leds = { !dec, 7'b0001110 };
	endcase

endmodule
