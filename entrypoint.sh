#!/bin/bash
set -e

if [ "$1" = 'ocr' ]; then
    exec ocr_start_listen
fi

exec "$@"
