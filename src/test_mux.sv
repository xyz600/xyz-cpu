`timescale 1ns/1ns
`include "mux.sv"

module TestMux();

    logic [31:0] in1, in2, out;
    logic sel;

    Multiplexer2 #(32) mux(
        .in1(in1),
        .in2(in2),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("in1 = %d", in1);
    end

    initial begin
        $display("start adder test");
        
        // 先頭
        in1 <= 10;
        in2 <= 20;

        #10;
        sel <= 0;
        #10;
        assert(out == 10) else $error("sel 0 failed");

        #10;
        sel <= 1;
        #10;
        assert(out == 20) else $error("sel 1 failed");
    end

endmodule