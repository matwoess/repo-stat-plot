#!/usr/bin/env bash

function help() {
  echo "Usage: $(basename $0) FILE [FILE]...
  Extract file extension and number of non-empty lines and prepend them to the path."
}

function prepend_info() {
  filepath=$1
  filename=$(basename -- "$filepath")
  extension="${filename##*.}"
  #filename="${filename%.*}"
  nlines=$(grep --count '.' "$filepath")
  printf "$extension $nlines $1\n"
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
  prepend_info $line
done

