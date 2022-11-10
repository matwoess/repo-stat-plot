#!/usr/bin/env bash

function help() {
  echo "Usage: $(basename $0) DIRECTORY
  List all *file* paths in DIRECTORY recursively.
  Files and folders starting with '.' (hidden files) will be excluded."
}

if [[ $# -ne 1 ]]; then
  echo "ERROR: invalid number of arguments!" >&2
  echo "" >&2
  help >&2
  exit 1
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  help
  exit 0
fi

# find all files in directory $1 that are of type file and do not start with "."
find $1 -not -path '*/.*' -type f
