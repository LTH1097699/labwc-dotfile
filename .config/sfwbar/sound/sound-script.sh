#!/bin/bash

DEFAULT_SINK=$(pactl info | grep 'Default Sink' | cut -d':' -f 2)

case $1 in
"+")
  pactl set-sink-volume $DEFAULT_SINK +5%;
  ;;
"-")
  pactl set-sink-volume $DEFAULT_SINK -5%;
  ;;
esac

# pactl get-sink-mute @DEFAULT_SINK@ //check mute state
# pactl get-sink-volume @DEFAULT_SINK@ //get volume %
# pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1 //get only volume %
