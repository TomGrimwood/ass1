//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskSix.v"

module TaskSix_tb();

reg [3:0]A_1;
reg [3:0]A_0;
reg [3:0]B_1;
reg [3:0]B_0;

wire [3:0]O_1;
wire [3:0]O_2;
wire [3:0]O_0;

TaskSix Z1(A_0, A_1, B_0, B_1, O_2,O_1,O_0);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", v[3], v[2], v[1], v[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskSix.vcd");
  $dumpvars(0, TaskSix_tb);
    A_0 = 4'd7;  //TENS
    A_1 = 4'd7;  //ONES
    B_0 = 4'd6;
    B_1 = 4'd4;
    #1;

    A_0 = 4'd7;  //TENS
    A_1 = 4'd6;   //ONES
    B_0 = 4'd5;
    B_1 = 4'd5;
    #1;

    A_0 = 4'd4;  //TENS
    A_1 = 4'd3;   //ONES
    B_0 = 4'd9;
    B_1 = 4'd9;
    #1;

    A_0 = 4'd9;  //TENS
    A_1 = 4'd9;   //ONES
    B_0 = 4'd9;
    B_1 = 4'd6;
    #1;

  $finish;
end
endmodule