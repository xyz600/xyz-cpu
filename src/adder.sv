module Adder
    #(parameter width = 8)
    (input logic [width-1:0] in1, in2,
    output logic [width-1:0] out, 
    output logic cout
);
    assign {cout, out} = in1 + in2;
endmodule