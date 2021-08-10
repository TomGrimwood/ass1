//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskTwo.v"

module TaskTwo_tb();

reg [3:0]a;
wire b;

Comparator iand2(a, b);
initial
begin
  $monitor("a3=%b, a2=%b, a1=%b, a0=%b, b=%b", a[3], a[2], a[1], a[0], b);
  $dumpfile("TaskTwoSim.vcd");
  $dumpvars(0, TaskTwo_tb);
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