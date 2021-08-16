//Two-input and gate test-bench
`timescale 1s/100ms
`include "TaskThree.v"

module TaskThree_tb();
reg [3:0]nibbl1;
reg [3:0]nibbl2;
reg CIN;
wire [8:0]h1;
wire [4:0]h2;

TaskThree T1(nibbl1,nibbl2,CIN,h1,h2);
initial
begin
  //$monitor("a3=%b, a2=%b, a1=%b, a0=%b, b3=%b, b2=%b, b1=%b, b0=%b", v[3], v[2], v[1], v[0], b[3], b[2], b[1], b[0]);
  $dumpfile("SIM-TaskThree.vcd");
  $dumpvars(0, TaskThree_tb);
    nibbl1[0] = 0; nibbl1[1] = 0; nibbl1[2] = 0; nibbl1[3] = 0; nibbl2[0] = 0; nibbl2[1] = 0; nibbl2[2] = 0; nibbl2[3] = 0; CIN = 0; #1;
    nibbl1[0] = 0; nibbl1[1] = 1; nibbl1[2] = 1; nibbl1[3] = 1; nibbl2[0] = 0; nibbl2[1] = 1; nibbl2[2] = 0; nibbl2[3] = 1; CIN = 0; #1;
    nibbl1[0] = 1; nibbl1[1] = 1; nibbl1[2] = 0; nibbl1[3] = 0; nibbl2[0] = 0; nibbl2[1] = 0; nibbl2[2] = 0; nibbl2[3] = 0; CIN = 0; #1;
    nibbl1[0] = 0; nibbl1[1] = 0; nibbl1[2] = 0; nibbl1[3] = 1; nibbl2[0] = 0; nibbl2[1] = 1; nibbl2[2] = 0; nibbl2[3] = 1; CIN = 0; #1;
    nibbl1[0] = 1; nibbl1[1] = 1; nibbl1[2] = 0; nibbl1[3] = 1; nibbl2[0] = 0; nibbl2[1] = 1; nibbl2[2] = 1; nibbl2[3] = 0; CIN = 0; #1;


  $finish;
end
endmodule