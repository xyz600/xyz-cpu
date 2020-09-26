`timescale 1ns/1ns
`include "adder.sv"

module TestAdder();

    logic [31:0] in1, in2, out;
    logic cout;

    Adder #(32) adder(
        .in1 (in1),
        .in2 (in2),
        .out (out),
        .cout (cout)
    );

    initial begin
        $monitor("in1 = %d", in1);
    end

    initial begin
        #10;
        for (int i = 0; i < 16; i++) begin
            in1 = i;
            in2 = i;
            #10;
            assert (out == 2 * i) else $error("adder test 1 failed");
            #10;
        end
    end

    initial begin
        #10;
        in1 = -10;
        in2 = 10;
        #10;
        assert (out == 0) else $error("adder test 2 failed");
        #10;
    end

endmodule