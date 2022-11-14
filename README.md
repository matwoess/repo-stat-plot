# Missing Semester - Assignment 1

This repo contains several different scripts for different specific tasks.  
All scripts work on their own (KISS), but can be connected by pipes to achieve some final higher purpose.  

I tried to follow general guidelines on how to write bash scripts.  
F.e. `#!`, checking number of parameters and handling `-h` or `--help` parameters to show usage and description of a script.  

## Scripts

### List files script
```sh
find-files.sh DIRECTORY
```
Has one required parameter that should be a directory.  
Uses the `find` tool to recursively find all files in `DIRECTORY` and outputs the paths to `stdout`.  
Hidden files and folders (starting with `'.'`) are excluded explicitly. F.e. the `.git` directory won't be shown.

### Extract and add data

```sh
prepend-info.sh FILE [FILE]...
```
Has one or more file paths as parameter when run on its own.  
Extracts the extension and number of non-empty lines of each file and outputs it with the additional info prepended to the path.  
Can also read from `stdin` when output is piped into the script. It will then do this for all file paths.  

### Plot with `matplotlib`

```sh
live-plot.py FILE
```
This is a python3 script that receives input from either a file as a first argument or from stdin (using module `fileinput`).  
It then plots a horizontal, sorted bar chart in real time. New categories are added dynamically and the axis rescales automatically.  
If a lot of data is given (or piped from the first and second script), we can watch the data being added step by step.  

Sample usage:
```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' | ./live-plot.py
```
This will show us real-time updates and finally will close the plot and output the final stats (can be further piped).

or:

```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' > data.txt
./live-plot.py data.txt
```
The second variant will keep the plot open to inspect.

### Plot to terminal using `gnuplot`

```sh
term-plot.sh FILE
```
Expects data in pairs of (`ext` `loc`) and will display a bar-chart in the terminal.  
Can also read data from `stdin`.  

## Example usage:

```sh
./find-files.sh repo
```
```
repo/process.sh
repo/python/plotting in python.py
repo/text/notes.txt
repo/text/README.md
repo/info-extraction.sh
repo/extensions.sh
repo/files.sh
```

```sh
./prepend-file-info.sh repo/extensions.sh repo/python/plotting-in-python.py repo/text/notes.txt
```

```
sh 12 repo/extensions.sh
py 16 repo/python/plotting in python.py
txt 3 repo/text/notes.txt
```

```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' > data.txt
./live-plot.sh data.txt
```

```sh
/find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' | ./live-plot.py > results.txt
cat results.txt
```

```
txt	3
py	16
md	20
sh	64
```

```sh
./find-files.sh repo | ./prepend-file-info.sh | awk '{print $1 " " $2}' | ./live-plot.py | ./term-plot.sh
```

```
     70 +---------------------------------------------------------------------------------------+   
        |              +                  +                   +                  +              |   
        |                                                                ****************       |   
        |                                                                *              *       |   
     60 |-+                                                              *              *     +-|   
        |                                                                *              *       |   
        |                                                                *              *       |   
     50 |-+                                                              *              *     +-|   
        |                                                                *              *       |   
        |                                                                *              *       |   
        |                                                                *              *       |   
     40 |-+                                                              *              *     +-|   
        |                                                                *              *       |   
        |                                                                *              *       |   
     30 |-+                                                              *              *     +-|   
        |                                                                *              *       |   
        |                                                                *              *       |   
        |                                                                *              *       |   
     20 |-+                                           ****************   *              *     +-|   
        |                          ****************   *              *   *              *       |   
        |                          *              *   *              *   *              *       |   
     10 |-+                        *              *   *              *   *              *     +-|   
        |                          *              *   *              *   *              *       |   
        |                          *              *   *              *   *              *       |   
        |       ****************   *      +       *   *       +      *   *       +      *       |   
      0 +---------------------------------------------------------------------------------------+   
                      txt                py                  md                 sh                  
                                             File extension                                  
```

## Demo video

[Demo Video](demo/demo.mp4)

## Dependencies
 - bash
 - python3
 - numpy
 - matplotlib
 - gnuplot
