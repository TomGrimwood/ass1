//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskFour.v"

module TaskFour_tb();
reg [4:0]IN;
reg c;
reg [3:0]a;
reg [3:0]b;

wire [3:0]s1;
wire [3:0]s0;

TaskFour Z1(a, b, c, s1,s0);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", v[3], v[2], v[1], v[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskFour.vcd");
  $dumpvars(0, TaskFour_tb);
   a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 1;
   b[3] = 1; b[2] = 0; b[1] = 0; b[0] = 1;
   c = 1;
    #1;

  $finish;
end
endmodule