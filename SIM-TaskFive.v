//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskFive.v"

module TaskFive_tb();

reg [3:0]bcdA_1;
reg [3:0]bcdA_0;
reg [3:0]bcdB_1;
reg [3:0]bcdB_0;

wire [3:0]bcdO_2;
wire [3:0]bcdO_1;
wire [3:0]bcdO_0;

TaskFive Z1(bcdA_1, bcdA_0, bcdB_1, bcdB_0, bcdO_2,bcdO_1,bcdO_0);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", v[3], v[2], v[1], v[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskFive.vcd");
  $dumpvars(0, TaskFive_tb);
    bcdA_1 = 4'b0001;  //TENS
    bcdA_0 = 4'b0001;   //ONES
    bcdB_1 = 4'b0001;
    bcdB_0 = 4'b0001;
    #1;

    bcdA_1 = 4'b0010;  //TENS
    bcdA_0 = 4'b0010;   //ONES
    bcdB_1 = 4'b0010;
    bcdB_0 = 4'b0010;
    #1;

    bcdA_1 = 4'b0100;  //TENS
    bcdA_0 = 4'b0100;   //ONES
    bcdB_1 = 4'b0100;
    bcdB_0 = 4'b0100;
    #1;

    bcdA_1 = 4'b1001;  //TENS
    bcdA_0 = 4'b1001;   //ONES
    bcdB_1 = 4'b1001;
    bcdB_0 = 4'b1001;
    #1;

  $finish;
end
endmodule