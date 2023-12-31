#!/bin/bash
set -e

# Check if an output directory is specified as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <output_dir>"
    exit 1
fi

output_dir="$1"

# Ensure the output directory exists
mkdir -p "$output_dir"

pycbc_brute_bank \
--verbose \
--output-file "$output_dir/bank.hdf" \
--minimal-match 0.95 \
--tolerance .005 \
--buffer-length 2 \
--sample-rate 2048 \
--tau0-threshold 0.5 \
--approximant IMRPhenomD \
--tau0-crawl 5 \
--tau0-start 0 \
--tau0-end 50 \
--psd-model aLIGOZeroDetLowPower \
--min 10 10 0 0 \
--max 40 40 .2 .2 \
--params mass1 mass2 spin1z spin2z \
--seed 1 \
--low-frequency-cutoff 20.0
