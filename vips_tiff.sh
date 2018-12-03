#!/usr/bin/env bash

# USAGE: ./vips_ptiff_no_icc.sh images/MARBLES.TIF images/marbles.ptif
vips im_vips2tiff $1 $2:jpeg:90,tile:256x256,pyramid