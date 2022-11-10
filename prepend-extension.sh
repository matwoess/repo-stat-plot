#!/usr/bin/env bash

function help() {
  echo "Usage: $(basename $0) [FILE]...
  Extract a file's extension and prepend it to the path."
}

function extract_and_prepend_extension() {
  filepath=$1
  filename=$(basename -- "$filepath")
  extension="${filename##*.}"
  #filename="${filename%.*}"
  printf "$extension $1\n"
}

input=""
if [[ -p /dev/stdin ]]; then
  input="$(cat -)"
else
  input="${@}"
fi

if [[ -z "${input}" ]]; then
  echo "ERROR: invalid number of arguments!" >&2
  echo "" >&2
  help >&2
  exit 1
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  help
  exit 0
fi

for line in $input; do
  extract_and_prepend_extension $line
done

