//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskTwo.v"

module circuitASim_tb();

reg [3:0]a;
wire [3:0]b;

CircuitA U1(a, b);
initial
begin
  $monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);
  $dumpfile("circuitASim.vcd");
  $dumpvars(0, circuitASim_tb);
  a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 0; #1;
  a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 1; #1;
  a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 0; #1;
  a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 1; #1;
  a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 0; #1;
  a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 1; #1;
  a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 0; #1;
  a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 1; #1;
  a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 0; #1;
  a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 1; #1;
  a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 0; #1;
  a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 1; #1;
  a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 0; #1;
  a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 1; #1;
  a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 0; #1;
  a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 1; #1;

  $finish;
end
endmodule