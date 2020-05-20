`timescale 100ms/100us
`include "multiplicador.v"

module benchmark_multiplicador();
reg [2:0] PORT_A;
reg [2:0] PORT_B;
wire [5:0] PORT_OUT;

reg [4:0] counter_1;
reg [4:0] counter_2;

multiplicador_2bit _dec(PORT_A, PORT_B, PORT_OUT);

initial
begin
  $monitor("Multiplicador binario 2 bits");
  $dumpfile("simulation.vcd");
  $dumpvars(0, benchmark_multiplicador);
  
  for (counter_1 = 0; counter_1 < 8 ; counter_1 ++ ) begin
    for (counter_2 = 0; counter_2 < 8 ; counter_2 ++ ) begin
      PORT_A = counter_1;
      PORT_B = counter_2; 
      #1;
    end
  end
  $finish;
end
endmodule // benchmark_comparator_4_bits
