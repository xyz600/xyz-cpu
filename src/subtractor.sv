`include "adder.sv"

module Subtractor
    #(parameter width = 8)
    (input logic [width-1:0] in1, in2,
    output logic [width-1:0] out
);

    logic [width-1:0] tmp_in2;
    logic cin;

    Adder #(32) adder(
        .in1 (in1),
        .in2 (tmp_in2),
        .cin (cin),
        .out(out)
    );
    assign tmp_in2 = ~in2;
    assign cin = 1;

endmodule