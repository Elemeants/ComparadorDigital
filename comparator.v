
module add_1_bit (
  input A1, B1, Cin,
  output S1, Cout
);
  assign {Cout, S1} = A1 + B1 + Cin;
endmodule

module add_2_bits ( A, B, Cin, S, Cout );
  input [1:0] A;
  input [1:0] B;
  input Cin;
  output [1:0] S;
  output Cout;
  wire c1;
  add_1_bit _s1(A[0], B[0], Cin, S[0], c1);
  add_1_bit _s2(A[1], B[1], c1, S[1], Cout);
endmodule

module add_4_bits (Cin, A, B, S, Cout);
  input [4:0] A;
  input [4:0] B;
  input Cin;
  output [4:0] S;
  output Cout;
  wire c1;
  add_2_bits _s1(A[1:0], B[1:0], Cin, S[1:0], c1);
  add_2_bits _s2(A[3:2], B[3:2], c1, S[3:2], Cout);
endmodule

module subs_4_bits ( A, B, CIN, S, COUT );
  input [4:0]A; 
  input [4:0]B; 
  input CIN;
  output [4:0]S;
  output COUT;

  add_4_bits _s1(CIN, ~B, A, S, COUT);
endmodule

module comparator_4_bits ( PORTA, PORTB, EQUAL, LESS, HIGHER );
  input [4:0] PORTA;
  input [4:0] PORTB;
  output EQUAL;
  output LESS;
  output HIGHER;
  wire aux;
  wire [4:0] res_out_port;

  subs_4_bits _sub1(PORTA, PORTB, 1'b1, res_out_port, aux);
  
  assign EQUAL = (PORTA == PORTB);
  assign LESS = aux & ~EQUAL;
  assign HIGHER = ~aux;
endmodule