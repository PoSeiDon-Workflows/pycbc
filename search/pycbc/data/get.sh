#!/bin/bash
set -e

# Check if a directory is specified as an argument
if [ $# -eq 0 ]; then
    # No directory specified, use the current directory
    output_dir="."
else
    # Use the specified directory
    output_dir="$1"
fi

# Ensure the output directory exists
mkdir -p "$output_dir"

# Download files and save them in the output directory
wget -nv -P "$output_dir" https://dcc.ligo.org/public/0146/P1700341/001/H-H1_LOSC_CLN_4_V1-1186740069-3584.gwf
wget -nv -P "$output_dir" https://dcc.ligo.org/public/0146/P1700341/001/L-L1_LOSC_CLN_4_V1-1186740069-3584.gwf
wget -nv -P "$output_dir" https://dcc.ligo.org/public/0146/P1700341/001/V-V1_LOSC_CLN_4_V1-1186739813-4096.gwf

