#!/bin/bash

##
# $ sudo pacman --sync --refresh --needed inotify-tools
# $ ./watch.sh
##

##
# Run once in the beginning so we don't need to change a file
# first to generate the static files for the first time.
#
printf '%s: Converting the files once\n' "$(date +'%F %T')"
ruby ../adocwiki/src/main.rb "$PWD"

##
# The watch for .adoc file changes.
#
inotifywait -qmr -e modify --exclude '\.?#.*' docs/ \
  | while read event; do
      printf '%s: %s\n' "$(date +'%F %T')" "$event"
      ruby ../adocwiki/src/main.rb "$PWD"
      mkdir -pv ./build/__assets
      cp -v ./docs/__assets/* ./build/__assets/
    done

