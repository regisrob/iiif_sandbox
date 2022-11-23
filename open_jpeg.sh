#!/usr/bin/env bash

# use Imagemagick to convert to a tiff file for clean input to OpenJPEG
convert $1 /tmp/temp.tif

# Use OpenJPEG to convert the TIFF to a lossy or lossless JP2 with tiles and precincts:
# - lossy 
opj_compress -i /tmp/temp.tif -o $2 -r 2.5 -n 7 -c "[512,512]" -b "64,64" -p RPCL -SOP -t 512,512 -TP R
# - lossless? (inspired from Bodleian's encoding profile using Kakadu: https://image-processing.readthedocs.io/en/latest/jp2_profile.html)
#opj_compress -i /tmp/temp.tif -o $2 -n 6 -l 6 -c "[256,256],[256,256],[128,128]" -b "64,64" -p RPCL -SOP -t "512,512" -EPH