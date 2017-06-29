#!/bin/bash

SCANFOLDER=/scans

inotifywait -r -e close_write --exclude '(\.sync)' -m --format "%w%f" "$SCANFOLDER" | while read file; do 
	echo "found new file $file"

	if [[ ! "$file" == *ocr.pdf ]]; then 
		tesseractocr "$file"
	else
		echo "Already scanned file: ${file}"
	fi
done
