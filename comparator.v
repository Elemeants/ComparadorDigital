`include "sumador.v"

module is_higher_4_bits(A, B, IS_HIGHER);
  input [3:0] A;
  input [3:0] B;
  output IS_HIGHER;
  wire [3:0] res_out_port;

  subs_4_bits _sub1(A, B, res_out_port, IS_HIGHER);
endmodule

module eq_4_bits ( A, B, IS_EQ );
  input [3:0]A; 
  input [3:0]B; 
  output IS_EQ;

  assign IS_EQ = ~(A[0] ^ B[0]) & ~(A[1] ^ B[1]) & ~(A[2] ^ B[2]) & ~(A[3] ^ B[3]);
endmodule

module comparator_4_bits ( PORTA, PORTB, EQUAL, LESS, HIGHER );
  input [3:0] PORTA;
  input [3:0] PORTB;
  output EQUAL;
  output LESS;
  output HIGHER;
  wire is_higher;
  wire [3:0] res_out_port;

  eq_4_bits _isEq(PORTA, PORTB, EQUAL);
  is_higher_4_bits _isLH(PORTA, PORTB, is_higher );
  
  assign HIGHER = ~EQUAL & is_higher;
  assign LESS = ~is_higher;
endmodule