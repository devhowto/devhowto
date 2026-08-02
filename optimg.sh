#!/usr/bin/env bash

##
# Optimizes un-committed PNG images (staged or not).
#
# This script depends on optipng, git and some standard Unix
# command line utilities.
##

##
# Get an array of uncommitted .png images.
#
readarray -t arr < <(\
  git status --short --porcelain \
    | grep '\.png$' \
    | cut -c 4- \
)

##
# Optimize .png images, if any.
#
if (( "${#arr[@]}" > 0 ))
then
  for f in "${arr[@]}"
  do
    echo "→ $f"
  done
fi
