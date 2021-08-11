//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskTwo.v"

module mux2to1Sim_tb();

reg x1, x2, s;
wire f;

mux2to1 U1(x1, x2, s, f);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);
  $dumpfile("mux2to1Sim.vcd");
  $dumpvars(0, mux2to1Sim_tb);
  x1 = 0; x2 = 0; s = 0; #1;
  x1 = 0; x2 = 0; s = 1; #1;
  x1 = 0; x2 = 1; s = 0; #1;
  x1 = 0; x2 = 1; s = 1; #1;
  x1 = 1; x2 = 0; s = 0; #1;
  x1 = 1; x2 = 0; s = 1; #1;
  x1 = 1; x2 = 1; s = 0; #1;
  x1 = 1; x2 = 1; s = 1; #1;

  $finish;
end
endmodule