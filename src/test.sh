#!/bin/bash

set -eu

. common.sh

shopt -s extglob

cd ${BIN_DIR}

for src in ${source}; do
    src_name=${src%.*}
    ./${src_name}
done

if [ -e wave.vcd ]; then
    gtkwave wave.vcd
fi