# Missing Semester - Assignment 1

This repo contains sever different scripts for different specific tasks.  
All scripts work on their own (KISS), but can be connected by pipes to achieve some final higher purpose.  

I tried to follow general guidelines on how to write bash scripts.  
F.e. checking number of parameters and handling `-h` or `--help` parameters to show usage and description of a script.  

## Scripts

```sh
find-files.sh DIRECTORY
```
Has one required parameter that should be a directory.  
Uses the `find` tool to recursively find all files in `DIRECTORY` and outputs the paths to `stdout`.  
Hidden files and folders (starting with `'.'`) are excluded explicitly. F.e. the `.git` directory won't be shown.

```sh
prepend-info.sh FILE [FILE]...
```
Has one or more file paths as parameter when run on its own.  
Extracts the extension and number of non-empty lines of each file and outputs it with the additional info prepended to the path.  
Can also read from `stdin` when output is piped into the script. It will then do this for all file paths.  

```sh
live-plot.py [FILE]
```
This is a python3 script that receives input from either a file as a first argument or from stdin (using module `fileinput`).  
It then plots a horizontal bar chart in real time. New categories are added dynamically and the axis rescales automatically.  
If much data is given or piped from the first and second script, we can watch the data be added step by step.  

Sample usage:
```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' | ./live-plot.py
```
This will show us real-time updates and finally will close the plot and output the final stats.

or:

```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' > data.txt
./live-plot.py data.txt
```
The second variant will keep the plot open to inspect.

## Dependencies
 - bash
 - python3
 - numpy
 - matplotlib
