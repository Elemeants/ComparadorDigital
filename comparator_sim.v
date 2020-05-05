`timescale 100ms/100us
`include "comparator.v"

module benchmark_comparator_4_bits();
reg [4:0] PORT_A;
reg [4:0] PORT_B;
wire EQUAL;
wire LESS;
wire HIGHER;

comparator_4_bits comp(PORT_A, PORT_B, EQUAL, LESS, HIGHER);

initial
begin
  $monitor("Comparador 4 bits, mayor, menor e igual");
  $dumpfile("simulation.vcd");
  $dumpvars(0, benchmark_comparator_4_bits);
  PORT_A = 4'b0000; PORT_B = 4'b0000; #1;
  PORT_A = 4'b0101; PORT_B = 4'b0000; #1;
  PORT_A = 4'b1000; PORT_B = 4'b1111; #1;
  PORT_A = 4'b0000; PORT_B = 4'b0001; #1;
  PORT_A = 4'b0011; PORT_B = 4'b0011; #1;
  PORT_A = 4'b0100; PORT_B = 4'b0100; #1;
  PORT_A = 4'b0111; PORT_B = 4'b0100; #1;
  PORT_A = 4'b1010; PORT_B = 4'b1011; #1;
  PORT_A = 4'b0100; PORT_B = 4'b0101; #1;
  PORT_A = 4'b0011; PORT_B = 4'b1011; #1;
  $finish;
end
endmodule // benchmark_comparator_4_bits
