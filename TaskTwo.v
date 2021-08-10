 
// v0 v1 v2 v3		dec		comp	circA			circB	
// 									b0 b1 b2 b3



// 0  0  0  0		0		0		0  0  0  0		0
// 0  0  0  1		1		0		0  0  0  0		0
// 0  0  1  0		2		0		0  0  0  0		0
// 0  0  1  1		3		0		0  0  0  0		0
// 0  1  0  0		4		0		0  0  0  0		0
// 0  1  0  1		5		0		0  0  0  0		0
// 0  1  1  0 		6		0		0  0  0  0		0
// 0  1  1  1		7		0		0  0  0  0		0
// 1  0  0  0		8		0		0  0  0  0		0
// 1  0  0  1		9		0		0  0  0  0		0
// 1  0  1  0		10		1		0  0  0  0		1
// 1  0  1  1		11		1		0  0  0  1		1
// 1  1  0  0		12		1		0  0  1  0		1
// 1  1  0  1		13		1		0  0  1  1		1
// 1  1  1  0		14		1		0  1  0  0		1
// 1  1  1  1		15		1		0  1  0  1		1
// 
//
// comp = v0 v2 + v0 v1
// b0   = 0
// b1   = v1 v2
// b2   = ~v2
// b3   = v3 
 module TaskTwo(SW,a);
 
	input[3:0]SW;
	output a;
	
	Comparator U1(SW[3:0], a);
 
	
 
 endmodule
 
 module Comparator(nibble, trueIfTenPlus);
	 
	 input[3:0]nibble;
	 output trueIfTenPlus;
	 
	 assign trueIfTenPlus = nibble[3] & (nibble[2] | nibble[1]);
	 
 endmodule
 

  module CircuitA(nibbleIn, nibbleOut);
	 
	 input[3:0]nibbleIn;
	 output [3:0]nibbleOut;
	 
	 assign nibbleOut[3] = nibbleIn[3];
	 assign nibbleOut[2] = ~nibbleIn[2];
	 assign nibbleOut[1] = nibbleIn[1] & nibbleIn[2];
	 assign nibbleOut[0] = 0;
	 
 endmodule
 
 module hexDisplay (SWs,HEX);

	input[3:0]SWs;
	output[6:0]HEX;
		
	assign HEX[0] = ~((SWs[3]) | (SWs[1]) | (SWs[2]&SWs[0]) | (~SWs[2]&~SWs[0]));
	assign HEX[1] = ~(~SWs[2] | ~SWs[1]&~SWs[0] | SWs[1]&SWs[0]);
	assign HEX[2] = ~(SWs[2] | ~SWs[1] | SWs[0]);
	assign HEX[3] = ~(~SWs[2]&~SWs[0] | SWs[1]&~SWs[0] | SWs[2]&~SWs[1]&SWs[0] | ~SWs[2]&SWs[1] | SWs[3]);
	assign HEX[4] = ~(~SWs[2]&~SWs[0] | SWs[1]&~SWs[0]);
	assign HEX[5] = ~ ( SWs[3] | ~SWs[1] & ~SWs[0] | SWs[2] & ~SWs[1] | SWs[2] & ~SWs[0] );
	assign HEX[6] = ~ ( SWs[3] | SWs[2]&~SWs[1] | ~SWs[2]&SWs[1] | SWs[1]&~SWs[0] );

endmodule

module CircuitB(trueIfTenPlus, HEX);

	input trueIfTenPlus;
	output [6:0]HEX;
	wire [3:0]w1;

	assign w1[3:0] = trueIfTenPlus;

	hexDisplay U1(w1[3:0],HEX);

endmodule

// module Mux2To1(xIn, s, f);

// 	input [1:0]xIn,s;
// 	output f;
// 	wire w1, w2;

// 	assign w1 = x[0] & ~s;
// 	assign w2 = x[1] & s;
	
// 	assign f  = w1 | w2;

// endmodule
 



 