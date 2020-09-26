`timescale 1ns/1ns
`include "clock.sv"

module TestClock();

    logic clk;

    Clock clock(
        .clock (clk)
    );

    initial begin
        $monitor("clk = %d", clk);
    end

    initial begin
        #1;
        for (int i = 0; i < 4; i++) begin
            assert(clk == 0) else $error("negedge failed"); #1;
            assert(clk == 1) else $error("posedge failed"); #1;
        end
        $finish;
    end

endmodule