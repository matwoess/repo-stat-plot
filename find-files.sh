function help() {
  echo "Usage: $(basename $0) DIRECTORY
  List all *file* paths in DIRECTORY recursively.
  Files and folders starting with '.' (hidden files) will be excluded."
}

if [[ $# -ne 1 ]]; then
  echo "ERROR: invalid number of arguments!" >&2
  help
  exit 1
fi

find $1 -not -path '*/.*' -type f
