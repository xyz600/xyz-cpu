module Adder
    #(parameter width = 8)
    (input logic [width-1:0] in1, in2,
    input logic cin,
    output logic [width-1:0] out, 
    output logic cout
);
    assign {cout, out} = in1 + in2 + cin;
endmodule