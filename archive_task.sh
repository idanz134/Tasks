#!/bin/bash

# get archive name from arguments or use current location
DIR="${1:-.}"

#
TIMESTAMP=$(date +%d%m%Y_%H%M%S)
ARCH_DIR="archive_$TIMESTAMP"
mkdir -p "$ARCH_DIR"

find "$DIR" -type f -mtime -1 ! -path "*/$ARCH_DIR/*" -exec cp --parents {} "$ARCH_DIR" \;

ARCH_NAME="archive_$TIMESTAMP.tar.gz"
tar -czf "$ARCH_NAME" "$ARCH_DIR" || zip -r "${ARCH_NAME%.tar.gz}.zip" "$ARCH_DIR" 
