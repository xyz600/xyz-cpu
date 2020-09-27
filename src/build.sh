#!/bin/bash

set -eu

shopt -s extglob

source=`ls !(test_*).sv`

echo ${source}

for src in ${source}; do
    src_name=${src%.*}
    iverilog -o ${src_name} -g2012 test_${src_name}.sv
done
