#!/bin/bash

# pre-requisite: `brew install imagemagick`
#
# 1. get list of svg (in pair with jpg)
# 2. run imagemagick with following command to overlay svg onto jpg
#    => composite -compose Multiply XYZ.svg XYZ.jpg output/XYZ-mix.jpg
#       ref: https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=23998

rm -rf output && mkdir output
time find . -iname "*.svg" | sed 's/\.svg$//' | xargs basename | awk '{system("composite -compose Multiply "$1".svg "$1".jpg output/"$1"-mix.jpg")}'
