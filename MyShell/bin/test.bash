#! /bin/bash
#
# test.bash
# Copyright (C) 2022 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


#!/bin/bash
texfile="$1"
pdffile="${texfile%.tex}.pdf"
pngfile="${texfile%.pdf}.png"
pdflatex -interaction=batchmode "$texfile"
pdfcrop "$pdffile" "${pdffile%.pdf}-cropped.pdf"
pdftoppm -png -f 1 -l 1 "${pdffile%.pdf}-cropped.pdf" > "$pngfile" 
convert "$pngfile" -transparent white "${pngfile%.png}-transparent.png"
