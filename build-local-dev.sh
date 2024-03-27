#!/bin/bash

#
# Install the utility ‘entr’. On Arch Linux, simply:
#
#   $ sudo pacman --sync --refresh --needed entr
#
# • https://github.com/eradman/entr
#
# Then run like this:
#
#   $ find ./docs -name '*.adoc' | entr -s ./build-local-dev.sh
#
rm -r ./build/* ; \
  ruby ../projects/adocwiki/src/main.rb $PWD \
  && ./copy-assets.sh
