#!/bin/bash
# General flow of the script
# 1. unzip inital zip that contains the nest (password: hackthebox)
# 2. Read out the contents of the then extracted zip
# 3. There is only one file, the next zip, grab the filename of that zip minus ".zip" at the end
# 4. Use that filename to unzip the zip
# 5. Repeat steps 2-4 with new zip until I suppose an error happens because there's no more zips to unzip?
