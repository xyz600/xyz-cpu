#!/bin/bash

set -eu

iverilog -s TestClock -o clock -g2012 test_clock.sv
