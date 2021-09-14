 
//	cin	v3 v2 v1 v0			dec		comp	circA			circB	
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

module TaskFive(bcdA_1, bcdA_0, bcdB_1, bcdB_0, bcdO_2,bcdO_1,bcdO_0);
input [3:0]bcdA_1;
input [3:0]bcdA_0;
input [3:0]bcdB_1;
input [3:0]bcdB_0;
output [3:0]bcdO_2;
output [3:0]bcdO_1;
output [3:0]bcdO_0;
wire [3:0]carryOnes;

BCD_ADDER AddOnes(bcdA_0,bcdB_0,1'b0,carryOnes,bcdO_0);
BCD_ADDER AddTens(bcdA_1,bcdB_1,carryOnes[0],bcdO_2,bcdO_1);





endmodule

module BCD_ADDER(a, b, c, s1,s0);
input [3:0]a;
input [3:0]b;
input c;
output [3:0]s1;
output [3:0]s0;
wire [2:0]cWire;
wire [4:0]adderOutput;
 //ADDER CIRCUIT
fullAdder F1(a[0],b[0], c, cWire[0], adderOutput[0]);
fullAdder F2(a[1],b[1], cWire[0], cWire[1], adderOutput[1]);
fullAdder F3(a[2],b[2], cWire[1], cWire[2], adderOutput[2]);
fullAdder F4(a[3],b[3], cWire[2], adderOutput[4], adderOutput[3]);

//TAKES 5bit from ADDER CIRCUIT and converts it to 2 BCD's s1, s0.
twoDigitBCD adder(adderOutput, s1, s0);

endmodule

module fullAdder (a, b, cIn, cOut, s);

    input a, b, cIn;
    output cOut, s;
    wire w1;

    
    assign w1 = a ^ b;
    assign s = w1 ^ cIn;

    mux2to1 M1(b, cIn, w1, cOut);


endmodule

module twoDigitBCD(fiveBitsIn, digitTens, digitOnes);

    input [4:0]fiveBitsIn;
    wire [3:0]lessThanTenOnes;
    wire [3:0]lessThanTenTens;
    wire [3:0]moreThanTenOnes;
    wire [3:0]moreThanTenTens;
    wire trueIfTenPlus;
    output [3:0]digitTens;
    output [3:0]digitOnes;

    assign lessThanTenOnes[3:0] = fiveBitsIn[3:0]; //if value is less than 10, the first 4 bits from input = ones BCD;
    assign lessThanTenTens[3:0] = 4'b0000; //if tvalue is less than 10, the BCD value for tens = 0000
    assign moreThanTenTens[3:0] = 4'b0001; //if the value is 10+, the BCD value for tens = 0001 

    assign moreThanTenOnes[0] = fiveBitsIn[0];
    assign moreThanTenOnes[1] = ~fiveBitsIn[1];
    assign moreThanTenOnes[2] = fiveBitsIn[4] & ~fiveBitsIn[1] | fiveBitsIn[3] & fiveBitsIn[2] & fiveBitsIn[1];
    assign moreThanTenOnes[3] = fiveBitsIn[4] & fiveBitsIn[1];

    greaterThan10 G1(fiveBitsIn,trueIfTenPlus);

    fourBitmux2to1 F1(lessThanTenOnes,moreThanTenOnes,trueIfTenPlus,digitOnes);
    fourBitmux2to1 F2(lessThanTenTens,moreThanTenTens,trueIfTenPlus,digitTens);

endmodule

module greaterThan10 (fiveBitsIn, moreThanTen);
    input [4:0]fiveBitsIn;
    output moreThanTen;

    assign moreThanTen = fiveBitsIn[4] | (fiveBitsIn[3] & fiveBitsIn[2]) | (fiveBitsIn[3] & fiveBitsIn[1]);

endmodule

module mux2to1 (x1, x2, s, f); 

	input x1, x2, s;
	output f;
	assign f = ( ~s&x1) | (s&x2);
	
endmodule

module fourBitmux2to1 (x1,x2,s,f);

	input [3:0]x1;
    input [3:0]x2;
    input s;
	output [3:0]f;

    assign f[0] = ( ~s&x1[0]) | (s&x2[0]);
    assign f[1] = ( ~s&x1[1]) | (s&x2[1]);
    assign f[2] = ( ~s&x1[2]) | (s&x2[2]);
    assign f[3] = ( ~s&x1[3]) | (s&x2[3]);

endmodule




