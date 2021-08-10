module TaskOne (SW,HEX0, HEX1, HEX2, HEX3);

	input[15:0]SW;
	output[6:0]HEX0, HEX1, HEX2, HEX3;
	
	hexDisplay U1(SW[15:12], HEX3);
	hexDisplay U2(SW[11:8], HEX2);
	hexDisplay U3(SW[7:4], HEX1);
	hexDisplay U4(SW[3:0], HEX0);

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
