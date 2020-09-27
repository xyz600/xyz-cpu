#!/bin/bash

set -eu

shopt -s extglob

source=`ls !(test_*).sv`

echo ${source}

for src in ${source}; do
    src_name=${src%.*}
    ./${src_name}
done