`timescale 1ns/1ns
`include "mux.sv"

module TestMux2();

    logic [31:0] in1, in2, in3, in4, out, out2;

    logic sel;
    Multiplexer2 #(32) mux2(
        .in1(in1),
        .in2(in2),
        .sel(sel),
        .out(out)
    );

    logic [1:0] sel2;
    Multiplexer4 #(32) mux4(
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .sel(sel2),
        .out(out2)
    );

    initial begin
        $monitor("in1 = %d", in1);
    end

    initial begin
        $display("start mux test");
        
        // 先頭
        in1 <= 10;
        in2 <= 20;
        in3 <= 30;
        in4 <= 40;
        
        // mux2
        #10;
        sel <= 'b0;
        #10;
        assert(out == 10) else $error("sel 0 failed");

        #10;
        sel <= 'b1;
        #10;
        assert(out == 20) else $error("sel 1 failed");

        #20;
        
        // mux4
        #10;
        sel2 <= 'b0;
        #10;
        assert(out2 == 10) else $error("sel 0 failed");

        #10;
        sel2 <= 'b1;
        #10;
        assert(out2 == 20) else $error("sel 1 failed");

        #10;
        sel2 <= 'b10;
        #10;
        assert(out2 == 30) else $error("sel 2 failed");

        #10;
        sel2 <= 'b11;
        #10;
        assert(out2 == 40) else $error("sel 3 failed");

    end

endmodule