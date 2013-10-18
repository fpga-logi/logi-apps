#!/bin/bash
./mjpg_streamer -i "./input_memory.so -i $1 -r 320x240" -o "./output_http.so -w ./www"
