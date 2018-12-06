#!/usr/bin/env bash
# Placeholder for generating Images using Kakadu
convert $1 /tmp/temp.tif  # use Imagemagick to convert to a tiff file for clean input to OpenJPEG
kdu_compress -i /tmp/temp.tif -o test.jp2 Clevels=7 "Cblk={64,64}" Cuse_sop=yes ORGgen_plt=yes ORGtparts=R Corder=RPCL -rate 4 "Cprecincts={256,256},{256,256},{256,256},{128,128},{128,128},{64,64},{64,64},{32,32},{16,16}"