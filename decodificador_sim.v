`timescale 100ms/100us
`include "decodificador.v"

module benchmark_decodificador_bcd();
reg [3:0] PORT_BCD;
wire [6:0] PORT_DISPLAY;

decodificador_bcd _bcd(PORT_BCD, PORT_DISPLAY);

initial
begin
  $monitor("Decodificador BCD a display 7seg");
  $dumpfile("simulation.vcd");
  $dumpvars(0, benchmark_decodificador_bcd);
  PORT_BCD = 4'b0000; #1;
  if (PORT_DISPLAY != 7'h3F) begin
    $display("test failed for input combination 00");
  end
  PORT_BCD = 4'b0001; #1;
  if (PORT_DISPLAY != 7'h06) begin
    $display("test failed for input combination 01");
  end
  PORT_BCD = 4'b0010; #1;
  if (PORT_DISPLAY != 7'h5B) begin
    $display("test failed for input combination 02");
  end
  PORT_BCD = 4'b0011; #1;
  if (PORT_DISPLAY != 7'h4F) begin
    $display("test failed for input combination 03");
  end
  PORT_BCD = 4'b0100; #1;
  if (PORT_DISPLAY != 7'h66) begin
    $display("test failed for input combination 04");
  end
  PORT_BCD = 4'b0101; #1;
  if (PORT_DISPLAY != 7'h6D) begin
    $display("test failed for input combination 05");
  end
  PORT_BCD = 4'b0110; #1;
  if (PORT_DISPLAY != 7'h7C) begin
    $display("test failed for input combination 06");
  end
  PORT_BCD = 4'b0111; #1;
  if (PORT_DISPLAY != 7'h07) begin
    $display("test failed for input combination 07");
  end
  PORT_BCD = 4'b1000; #1;
  if (PORT_DISPLAY != 7'h7F) begin
    $display("test failed for input combination 08");
  end
  PORT_BCD = 4'b1001; #1;
  if (PORT_DISPLAY != 7'h67) begin
    $display("test failed for input combination 09");
  end
  $finish;
end
endmodule // benchmark_comparator_4_bits
