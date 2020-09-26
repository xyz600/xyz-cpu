#!/bin/bash

set -eu

iverilog -s TestAdder -o adder -g2012 test_adder.sv
iverilog -s TestClock -o clock -g2012 test_clock.sv
