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
prepend-extension.sh FILE [FILE]...
```
Has one or more file paths as parameter when run on its own.  
Extracts the extension of each file and outputs it with the extension prepended to the path.  
Can also read from `stdin` when output is piped into the script. It will then do this for all file paths.  

## Dependencies
 - bash
