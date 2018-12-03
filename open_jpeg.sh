#!/usr/bin/env bash
convert $1 /tmp/temp.tif  # use Imagemagick to convert to a tiff file for clean input to OpenJPEG
# Use OpenJPEG to convert the TIFF to a lossy compressed JP2 with tiles and precincts
opj_compress -i /tmp/temp.tif -o $2 -r 2.5 -n 7 -c "[256,256]"  -b "64,64" -p RPCL -SOP -t 512,512 -TP R