//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskTwo.v"

module TaskTwo_tb();

reg v[3:0];
wire h1[7:0], h2[7:0];
wire m[3:0];
wire z;

TaskTwo T1(V, h1,h2, z, m);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", V[3], V[2], V[1], V[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskTwo.vcd");
  $dumpvars(0, TaskTwo_tb);
  V[3] = 0; V[2] = 0; V[1] = 0; V[0] = 0; #1;
  V[3] = 0; V[2] = 0; V[1] = 0; V[0] = 1; #1;
  V[3] = 0; V[2] = 0; V[1] = 1; V[0] = 0; #1;
  V[3] = 0; V[2] = 0; V[1] = 1; V[0] = 1; #1;
  V[3] = 0; V[2] = 1; V[1] = 0; V[0] = 0; #1;
  V[3] = 0; V[2] = 1; V[1] = 0; V[0] = 1; #1;
  V[3] = 0; V[2] = 1; V[1] = 1; V[0] = 0; #1;
  V[3] = 0; V[2] = 1; V[1] = 1; V[0] = 1; #1;
  V[3] = 1; V[2] = 0; V[1] = 0; V[0] = 0; #1;
  V[3] = 1; V[2] = 0; V[1] = 0; V[0] = 1; #1;
  V[3] = 1; V[2] = 0; V[1] = 1; V[0] = 0; #1;
  V[3] = 1; V[2] = 0; V[1] = 1; V[0] = 1; #1;
  V[3] = 1; V[2] = 1; V[1] = 0; V[0] = 0; #1;
  V[3] = 1; V[2] = 1; V[1] = 0; V[0] = 1; #1;
  V[3] = 1; V[2] = 1; V[1] = 1; V[0] = 0; #1;
  V[3] = 1; V[2] = 1; V[1] = 1; V[0] = 1; #1;

  $finish;
end
endmodule