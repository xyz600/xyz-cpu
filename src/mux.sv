// sel == 0 なら in1, sel == 1 なら in2
module Multiplexer2
    #(parameter width = 2)
    (input logic [width-1:0] in1, in2,
    input logic sel,
    output logic [width-1:0] out
);
    assign out = sel ? in2 : in1;
endmodule

module Multiplexer4
    #(parameter width = 2)
    (input logic [width-1:0] in1, in2, in3, in4,
    input logic [1:0] sel,
    output logic [width-1:0] out
);
    assign out = sel[1] ? (sel[0] ? in4 : in3) : (sel[0] ? in2 : in1);

endmodule

