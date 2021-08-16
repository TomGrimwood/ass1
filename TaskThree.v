module TaskThree(SW,LEDR,LEDG);

input [8:0]SW;
output [8:0]LEDR;
output [4:0]LEDG;
slave T1(SW[7:4],SW[3:0], SW[8], LEDR, LEDG);

endmodule



module slave(A, B, CIN,LEDR,LEDG);

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
	assign f = ( ~s&x1) | (s&x2);
	
endmodule
 
