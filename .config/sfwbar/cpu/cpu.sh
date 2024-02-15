#!/usr/bin/env bash

lscpu | awk '/ scaling MHz/ {print $4}'

# https://manpages.ubuntu.com/manpages/jammy/man1/cpupower-frequency-set.1.html
