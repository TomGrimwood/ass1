//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskTwo.v"

module TaskTwo_tb();

reg [3:0]v;
wire [6:0]h1;
wire [6:0]h2;

TaskTwo T1(v, h1, h2);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", v[3], v[2], v[1], v[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskTwo.vcd");
  $dumpvars(0, TaskTwo_tb);
  v[3] = 0; v[2] = 0; v[1] = 0; v[0] = 0; #1;
  v[3] = 0; v[2] = 0; v[1] = 0; v[0] = 1; #1;
  v[3] = 0; v[2] = 0; v[1] = 1; v[0] = 0; #1;
  v[3] = 0; v[2] = 0; v[1] = 1; v[0] = 1; #1;
  v[3] = 0; v[2] = 1; v[1] = 0; v[0] = 0; #1;
  v[3] = 0; v[2] = 1; v[1] = 0; v[0] = 1; #1;
  v[3] = 0; v[2] = 1; v[1] = 1; v[0] = 0; #1;
  v[3] = 0; v[2] = 1; v[1] = 1; v[0] = 1; #1;
  v[3] = 1; v[2] = 0; v[1] = 0; v[0] = 0; #1;
  v[3] = 1; v[2] = 0; v[1] = 0; v[0] = 1; #1;
  v[3] = 1; v[2] = 0; v[1] = 1; v[0] = 0; #1;
  v[3] = 1; v[2] = 0; v[1] = 1; v[0] = 1; #1;
  v[3] = 1; v[2] = 1; v[1] = 0; v[0] = 0; #1;
  v[3] = 1; v[2] = 1; v[1] = 0; v[0] = 1; #1;
  v[3] = 1; v[2] = 1; v[1] = 1; v[0] = 0; #1;
  v[3] = 1; v[2] = 1; v[1] = 1; v[0] = 1; #1;

  $finish;
end
endmodule