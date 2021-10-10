#!/bin/bash
# General flow of the script
# 1. unzip inital zip that contains the nest (password: hackthebox)
# 2. Read out the contents of the then extracted zip
# 3. There is only one file, the next zip, grab the filename of that zip minus ".zip" at the end
# 4. Use that filename as the password to extract the zip out
# 5. Delete old zip
# 6. Repeat steps 2-5 with new zip until I suppose an error happens because there's no more zips to unzip?


get_passwd ()
{
    local zip_filename=$(unzip -Z1 "$1")
    local passwd=$(echo "$zip_filename" | sed "s/.zip//")
    echo "$passwd"
}

# process_zip
# Usage:
# process_zip <zip>
process_zip ()
{
    local file_to_process="$1"
    local passwd=$(get_passwd "$file_to_process")
}
