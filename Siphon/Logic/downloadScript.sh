#!/bin/sh

cd ~/Downloads
yt-dlp "$1" -S "$2"
