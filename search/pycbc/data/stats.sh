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

pycbc_dtphase \
--ifos H1 L1 \
--relative-sensitivities .7 1 \
--sample-size 200000 \
--snr-ratio 2.0 \
--seed 10 \
--output-file "$output_dir/statHL.hdf" \
--smoothing-sigma 1 \
--verbose

pycbc_dtphase \
--ifos L1 V1 \
--relative-sensitivities 1 0.3 \
--sample-size 200000 \
--snr-ratio 2.0 \
--seed 10 \
--output-file "$output_dir/statLV.hdf" \
--smoothing-sigma 1 \
--verbose

pycbc_dtphase \
--ifos H1 V1 \
--relative-sensitivities .7 .3 \
--sample-size 200000 \
--snr-ratio 2.0 \
--seed 10 \
--output-file "$output_dir/statHV.hdf" \
--smoothing-sigma 1 \
--verbose

pycbc_dtphase \
--ifos H1 L1 V1 \
--relative-sensitivities .7 1 .3 \
--sample-size 50000 \
--timing-uncertainty .01 \
--snr-ratio 2.0 \
--seed 10 \
--output-file "$output_dir/statHLV.hdf" \
--smoothing-sigma 1 \
--verbose

