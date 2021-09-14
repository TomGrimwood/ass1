module TaskSix(aZero, aOne, bZero, bOne, carry, Tens, Ones);

wire [4:0]Te;
wire [4:0]tAgain;

input [3:0]aZero;
input [3:0]aOne;
input [3:0]bZero;
input [3:0]bOne;

wire [3:0]Z;
wire [3:0]zAgain;
wire [3:0]c1;
wire c2;

output [3:0]Tens;
output [3:0]Ones;
output [3:0]carry;

    assign Te = aZero + bZero;


    assign Z = (Te > 9) ? 4'b1010 : 4'b0000;
    assign c1 = (Te > 9) ? 4'b0001 : 4'b0000;

    assign Ones = Te - Z;

    assign tAgain = aOne + bOne + c1;
    
    assign zAgain = (tAgain > 9) ? 4'b1010 : 4'b0000;
    assign c2 = (tAgain > 9) ? 4'b0001 : 4'b0000;

    assign Tens = tAgain - zAgain;
    assign carry = c2;
endmodule

    
    