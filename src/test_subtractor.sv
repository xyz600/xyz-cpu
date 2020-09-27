`timescale 1ns/1ns
`include "subtractor.sv"

module TestSubtractor();

    logic [31:0] in1, in2, out;

    Subtractor #(32) suber(
        .in1 (in1),
        .in2 (in2),
        .out (out)
    );

    initial begin
        $monitor("in1 = %d", in1);
    end

    initial begin
        $display("start subtract test");
        #10;
        // 引き算の例
        for (int i = 0; i < 16; i++) begin
            in1 <= i;
            in2 <= i;
            #10;
            assert (out == 0) else $error("adder test 1 failed");
            #10;
        end

        // 負の引き算の例(cin 無効)
        #10;
        in1 <= 10;
        in2 <= 4;
        #10;
        assert (out == 6) else $error("adder test 2 failed");
        #10;

        // 負の足し算の例(cin 有効)
        in1 <= 0;
        in2 <= 10;
        #10;
        assert (out == -10) else $error("adder test 2 failed");
        #10;
    end

endmodule