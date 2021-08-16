module TaskFour(SW,LEDR,LEDG,HEX0,HEX1,HEX4,HEX6);
	
	input [8:0]SW;
	input[6:0]HEX0,HEX1,HEX4,HEX6;
	output [8:0]LEDR;
	output [4:0]LEDG;
	slave T1(SW[7:4],SW[3:0], SW[8], LEDR, LEDG);
	hexDisplay B3(SW[7:4], HEX6);
		hexDisplay B2(SW[3:0], HEX4);
		
	BCD B1(LEDG, HEX1, HEX0);
endmodule



module slave(A,B,CIN,LEDR,LEDG, );

	input [3:0]A;
	input [3:0]B;
	input CIN;
	output [8:0]LEDR;
	output [4:0]LEDG;
	wire [2:0]cWire;

	fullAdder U1(A[0],B[0],CIN,cWire[0],LEDG[0]);
	fullAdder U2(A[1],B[1],cWire[0],cWire[1],LEDG[1]);
	fullAdder U3(A[2],B[2],cWire[1],cWire[2],LEDG[2]);
	fullAdder U4(A[3],B[3],cWire[2],LEDG[4],LEDG[3]);

	assign LEDR[7:4] = A;
	assign LEDR[3:0] = B;
	assign LEDR[8] = CIN;

endmodule


module fullAdder (a, b, cIn, cOut, s);

    input a, b, cIn;
    output cOut, s;
    wire w1;

    
    assign w1 = a ^ b;
    assign s = w1 ^ cIn;

    mux2to1 M1(b, cIn, w1, cOut);

endmodule

module mux2to1 (x1, x2, s, f); 

	input x1, x2, s;
	output f;
	assign f = (~s&x1) | (s&x2);
	
endmodule



module BCD(binInputs, HEXTENS, HEXONES);

	input[4:0]binInputs;
//	output decOutputs_1;
//	output [3:0]decOutputs_10;
	output HEXTENS;
	output HEXONES;
	wire [4:0]m;
	wire [3:0]aOut;
	wire Z;
	wire untrue = 1'b0;

	Comparator U1( binInputs[3:0], Z );

	CircuitA A1( binInputs[4:0], aOut[3:0]);

	
	mux2to1 M4( binInputs[4], untrue, Z, m[4] );
	mux2to1 M3( binInputs[3], aOut[3], Z, m[3] );
	mux2to1 M2( binInputs[2], aOut[2], Z, m[2] );
	mux2to1 M1( binInputs[1], aOut[1], Z, m[1] );
	mux2to1 M0( binInputs[0], aOut[0], Z, m[0] );
	
	
	CircuitB H1( Z, HEXTENS );
	hexDisplay H2(m[3:0], HEXONES);
endmodule



module Comparator(nibble, trueIfTenPlus);
	 
	input[4:0]nibble;
	output trueIfTenPlus;
	 
	assign trueIfTenPlus = (nibble[3] & (nibble[2] | nibble[1])) | nibble[4];
	 
endmodule
 

module CircuitA(inputs, outputs);
	 
	input[4:0]inputs;
	output [3:0]outputs;
	
	assign outputs[3] = inputs[3] & ~inputs[1]; 
	assign outputs[2] = (~inputs[3] & ~inputs[1]) | (inputs[2] & inputs[1]);
	assign outputs[1] = ~inputs[1];
	assign outputs[0] = inputs[0];
	 
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
