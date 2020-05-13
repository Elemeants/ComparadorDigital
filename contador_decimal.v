`include "decodificador.v"
`include "comparator.v"

module counter_decimal_19(amount, _on_dec_disp, display_decs);
  input [4:0] amount;
  output _on_dec_disp;
  output [6:0] display_decs;
  wire [3:0] bcd_data;
  wire [3:0] amount_if_higher;
  wire [3:0] amount_bcd;
  wire _is_higher_4bits;
  wire nc;


  is_higher_4_bits higher(amount[3:0], 4'hA, _is_higher_4bits);
  assign _on_dec_disp = _is_higher_4bits | amount[4];
  assign amount_if_higher = _on_dec_disp ? 4'h6 : 4'h0;

  add_4_bits sum(1'b0, amount[3:0], amount_if_higher, amount_bcd, nc);

  assign bcd_data = amount_bcd;

  decodificador_bcd bcd(bcd_data, display_decs);

endmodule // counter_decimal_19
