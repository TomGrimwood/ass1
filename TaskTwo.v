 
//	cin	v0 v1 v2 v3			dec		comp	circA			circB	
//											b3 b2 b1 b0



//	0	0  0  0  0			0		0		0  0  0  0		0
//	0	0  0  0  1			1		0		0  0  0  0		0
//	0	0  0  1  0			2		0		0  0  0  0		0
//	0	0  0  1  1			3		0		0  0  0  0		0
//	0	0  1  0  0			4		0		0  0  0  0		0
//	0	0  1  0  1			5		0		0  0  0  0		0
//	0	0  1  1  0 			6		0		0  0  0  0		0
//	0	0  1  1  1			7		0		0  0  0  0		0
//	0	1  0  0  0			8		0		0  0  0  0		0
//	0	1  0  0  1			9		0		0  0  0  0		0
//	0	1  0  1  0			10		1		0  0  0  0		1
//	0	1  0  1  1			11		1		0  0  0  1		1
//	0	1  1  0  0			12		1		0  0  1  0		1
//	0	1  1  0  1			13		1		0  0  1  1		1
//	0	1  1  1  0			14		1		0  1  0  0		1
//	0	1  1  1  1			15		1		0  1  0  1		1
//	1	0  0  0  0			16		1		0  1  1  0		1
//	1	0  0  0  1			17		1		0  1  1  1		1
//	1	0  0  1  0			18		1		1  0  0  0		1
//	1	0  0  1  1			19		1		1  0  0  1		1

// 
//
// comp = v0 v2 + v0 v1
// b0   = 0
// b1   = v1 v2
// b2   = ~v2
// b3   = v3 
 module TaskTwo(V, HEXTens, HEXOnes);
 
	input[3:0]V;
	output [6:0]HEXTens;
	output [6:0]HEXOnes;
	wire [3:0]m;
	wire [2:0]aOut;
	wire Z;
	wire untrue = 1'b0;

	Comparator U1( V[3:0], Z );

	CircuitA A1( V[2:0], aOut[2:0]);

	
	mux2to1 M3( V[3], untrue, Z, m[3] );
	mux2to1 M2( V[2], aOut[2], Z, m[2] );
	mux2to1 M1( V[1], aOut[1], Z, m[1] );
	mux2to1 M0( V[0], aOut[0], Z, m[0] );

	CircuitB B1( Z, HEXTens[6:0]);
	
	hexDisplay H1( m, HEXOnes[6:0]);
	

 
	
 
 endmodule
 
 module Comparator(nibble, trueIfTenPlus);
	 
	 input[3:0]nibble;
	 output trueIfTenPlus;
	 
	 assign trueIfTenPlus = nibble[3] & (nibble[2] | nibble[1]);
	 
 endmodule
 

  module CircuitA(nibbleIn, nibbleOut);
	 
	 input[2:0]nibbleIn;
	 output [2:0]nibbleOut;
	 
	 assign nibbleOut[2] = nibbleIn[1] & nibbleIn[2];
	 assign nibbleOut[1] = ~nibbleIn[1];
	 assign nibbleOut[0] = nibbleIn[0];
	 
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

	hexDisplay U1(w1[3:0],HEX[6:0]);

endmodule

module mux2to1 (x1, x2, s, f); 
	input x1, x2, s;
	output f;
	assign f = ( ~s&x1) | (s&x2);
endmodule
 



 