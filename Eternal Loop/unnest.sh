#!/bin/bash
# General flow of the script
# 1. unzip inital zip that contains the nest (password: hackthebox)
# 2. Read out the contents of the then extracted zip
# 3. There is only one file, the next zip, grab the filename of that zip minus ".zip" at the end
# 4. Use that filename as the password to extract the zip out
# 5. Delete old zip
# 6. Repeat steps 2-5 with new zip until I suppose an error happens because there's no more zips to unzip?


# get_passwd
# ===========
# Function to grab the password required to open the Zip file according to the rules of the challenge
# It does this by:
# Reading out the listing of the files within the Zip
# Since there's only one file, it gets the filename, strips out the .zip at the end and returns it.
#
# Usage:
# get_passwd <zip attempting to open>
get_passwd ()
{
    local zip_filename=$(unzip -Z1 "$1")
    local passwd=$(echo "$zip_filename" | sed "s/.zip//")
    echo "$passwd"
}

# process_zip
# ===========
# Main Zip extraction loop logic
# Designed to be recursive
# Note: God I hope Bash can do recursive logic
#
# Usage:
# process_zip <zip>
process_zip ()
{
    # Gets the password using get_password
    # Calls unzip with the password to unzip the target Zip
    local file_to_process="$1"
    local passwd=$(get_passwd "$file_to_process")

    #Attempt to unzip
    unzip -P "$passwd" "$file_to_process"

    # Check exit code to see if it worked and act accordingly
    if [ $? -eq 0 ] #success
    then
        echo "I've succeeded in extracting the zip $file_to_process for ya! <3"

        # Calls itself again with the new unzipped zip
        # Which it already knows the filename to because,
        # the filename of the new Zip is the password of the Old one
        process_zip "$passwd.zip"

    if [ $? -eq 82 ] #failed, wrong pass
    then
        echo "Zip extraction failed due to incorrect password" >&2
        echo "Attempted password: $passwd" >&2
        exit 1
    else #idfk what happened
        echo "Failed due to unknown error" >&2
        echo "Error code from unzip: $?" >&2
        exit 2
    fi



}
