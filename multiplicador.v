`include "sumador.v"

module multiplicador_2bit(PORT_A, PORT_B, PORT_OUT);
input [2:0] PORT_A;
input [2:0] PORT_B;
output [5:0] PORT_OUT;

wire [2:0] MULT_BUS_0;
wire [2:0] MULT_BUS_1;
wire [2:0] MULT_BUS_2;

assign MULT_BUS_0 = { PORT_A[2] & PORT_B[0], PORT_A[1] & PORT_B[0], PORT_A[0] & PORT_B[0] };
assign MULT_BUS_1 = { PORT_A[2] & PORT_B[1], PORT_A[1] & PORT_B[1], PORT_A[0] & PORT_B[1] };
assign MULT_BUS_2 = { PORT_A[2] & PORT_B[2], PORT_A[1] & PORT_B[2], PORT_A[0] & PORT_B[2] };

wire [3:0] CIN_SUM1;

wire nc;
wire nc_2;

assign PORT_OUT[0] = MULT_BUS_0[0];
add_4_bits _sum1(1'b0, {2'b00, MULT_BUS_0[2:1]}, {1'b0, MULT_BUS_1}, CIN_SUM1, nc);
add_4_bits _sum2(1'b0, {MULT_BUS_2, 1'b0}, CIN_SUM1, PORT_OUT[4:1], PORT_OUT[5]);


endmodule // multiplicador_2bit