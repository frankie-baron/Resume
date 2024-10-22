#!/bin/bash

# Hardcoded markers
start_marker="<!-- STRIP-BEGIN -->"
end_marker="<!-- STRIP-END -->"

# Check if file is provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file=$1

# Check if file exists
if [[ ! -f "$file" ]]; then
    echo "File not found: $file"
    exit 1
fi

# Use awk to strip content between the markers
awk -v start="$start_marker" -v end="$end_marker" '
$0 ~ start {inside=1; next} 
$0 ~ end {inside=0; next} 
!inside {print}
' "$file" > temp_file && mv temp_file "$file"

echo "Content between '$start_marker' and '$end_marker' has been removed from $file."
