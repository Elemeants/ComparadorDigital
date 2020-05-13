`timescale 100ms/100us
`include "contador_decimal.v"

module benchmark_counter_decimal_19();
reg [4:0] PORT_BCD;
wire SET_ON_DISPLAY_DEC;
wire [6:0] PORT_DISPLAY;

reg [4:0] counter;

counter_decimal_19 _dec(PORT_BCD, SET_ON_DISPLAY_DEC, PORT_DISPLAY);

initial
begin
  $monitor("Decodificador BCD a display 7seg");
  $dumpfile("simulation.vcd");
  $dumpvars(0, benchmark_counter_decimal_19);
  
  for (counter=0; counter<=19; counter++) begin
    PORT_BCD = counter; #1;
  end
  $finish;
end
endmodule // benchmark_comparator_4_bits
