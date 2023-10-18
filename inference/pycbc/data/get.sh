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

for ifo in H-H1 L-L1 V-V1
do
    file=${ifo}_LOSC_CLN_4_V1-1187007040-2048.gwf
    file_path="$output_dir/$file"
    
    # If the file already exists in the output directory, skip the download
    if [ -f "$file_path" ]; then
        echo "File $file_path already exists. Skipping download."
    else
        # Download the file and save it to the output directory
        curl -o "$file_path" --show-error --silent "https://dcc.ligo.org/public/0146/P1700349/001/$file"
    fi
done

