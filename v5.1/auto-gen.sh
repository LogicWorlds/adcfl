#!/bin/bash

img="$1"

width="$(identify -format '%w' "$img")"
height="$(identify -format '%h' "$img")"

newWidth=738
newHeight=450

offsetX=$(($width / 2 - $newWidth / 2))
offsetY=$(($height / 2 - $newHeight / 2))

convert \
    -crop "$newWidth"x"$newHeight"+"$offsetX"+"$offsetY" \
    -blur 0x3 \
    -fill "rgb(32, 32, 32)" \
    -draw "rectangle 0,0 $newWidth,46" \
    "$img" "$img"