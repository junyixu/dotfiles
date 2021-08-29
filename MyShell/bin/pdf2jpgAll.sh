#! /bin/sh
#
# test.sh
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#

dir=~/Sync/uni_pdf
dst_dir="$HOME/.cache/LaTeXNotesPDFImg"

__DEFAULT_SIZE="1920x1080"
for __note in $dir/*.pdf; do
	pdftoppm -f 1 -l 1 \
				 -scale-to-x "${__DEFAULT_SIZE%x*}" \
				 -scale-to-y -1 \
				 -singlefile \
				 -jpeg -tiffcompression jpeg \
				 -- "$__note" "$dst_dir/$(basename $__note .pdf)" 
done
