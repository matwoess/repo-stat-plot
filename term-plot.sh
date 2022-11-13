#!/usr/bin/env bash

function help() {
  echo "Usage: $(basename $0) FILE
  Plot a horizontal bar chart given input form stdin or a file.
  Expects pairs of (string integer) to work."
}

function plot_barh() {
  gnuplot -e "set autoscale; set yrange[0:]" \
          -e "set xlabel 'File extension'" \
          -e "set ylabel 'Lines of Code'" \
          -e "set boxwidth 0.8" \
          -e "set terminal dumb size 100, 30" \
          -e "plot '$1' u 2:xtic(1) with boxes notitle"	
}

input=""
if [[ -p /dev/stdin ]]; then
  input="/dev/stdin"
else
  input=$1
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

plot_barh "$input"
