module Clock(
    output logic clock
);

    always begin
        clock <= 0; #1;
        clock <= 1; #1;
    end

endmodule