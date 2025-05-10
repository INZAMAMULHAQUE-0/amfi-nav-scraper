#!/bin/bash

# URL to fetch
URL="https://www.amfiindia.com/spages/NAVAll.txt"
# Output TSV file
OUTPUT_FILE="scheme_nav.tsv"

# Download and process
curl -s "$URL" | awk -F '|' '
BEGIN {
    OFS = "\t"; # Output tab-separated
    print "Scheme Name", "Asset Value"
}
NF == 6 && $4 != "" && $5 != "" {
    print $4, $5
}' > "$OUTPUT_FILE"

echo "Saved Scheme Name and Asset Value to $OUTPUT_FILE"