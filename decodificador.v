module decodificador_bcd_not_port(A, B, C, D, _bcd_display);
  input A;
  input B;
  input C;
  input D;
  output [6:0] _bcd_display;

  assign _bcd_display[0] = |{(!C&!A),(C&A),(D),(B&A)};
  assign _bcd_display[1] = |{(!B&!A),(B&A),(!C),(D)};
  assign _bcd_display[2] = |{!B,A,C,D};
  assign _bcd_display[3] = |{C&!B&A,!C&!A,!C&B,B&!A,D&C};
  assign _bcd_display[4] = |{!C&!A,B&!A,D&B,D&C};
  assign _bcd_display[5] = |{!B&!A,C&!B,C&!A,D};
  assign _bcd_display[6] = |{!C&B,C&!B,D,B&!A};
endmodule // decodificador_bcd

module decodificador_bcd(bcd, _bcd_display);
  input [3:0] bcd;
  output [6:0] _bcd_display;

  decodificador_bcd_not_port decoder(bcd[0], bcd[1], bcd[2], bcd[3], _bcd_display);
endmodule // decodificador_bcd
