#!/bin/bash

set -eu

shopt -s extglob

. common.sh

if [ ! -d ${BIN_DIR} ]; then
        mkdir ${BIN_DIR}
fi

for src in ${source}; do
    src_name=${src%.*}
    iverilog -o ${BIN_DIR}/${src_name} -g2012 test_${src_name}.sv
done
