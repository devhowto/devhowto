#!/bin/bash

1> /dev/null cat <<'EOF'

#sed IRC channel on libera.chat.

Earnestly | Also image:: is on its own line, so that should be simple
Earnestly | fernando-basso: grep -Po '^image::\K.*?(?=(?<!\\)\[)' # Look for
          | ^image:: and \K discard it. Select everything but lookahead for [
          | unless lookbehind saw \ before it
EOF

adoc_file="$1"
adoc_imgs=()

##
# Compute the basename of the file.
#
while read -r line
do
  if [[ $line =~ image:: ]]
  then
    img="${line##*/}"
    img="${img%%[*}"

    adoc_imgs+=("$img")
  fi
done < "$adoc_file"

##
# Find each file and copy to the destination.
#
for adoc_img in "${adoc_imgs[@]}"
do
  ##
  # Create an array of images. Some have been duplicated as time
  # passed, so we know we may have more than one file for the
  # “same” image.
  #
  mapfile -d $'\0' imgs_to_copy < <(\
    find ~/pCloudDrive/SRC-Studies/old-dev-notes \
      -name "$adoc_img" \
      -print0 \
  )

  ##
  # If the “same” image existed in more than one directory, let's copy
  # it with an increasing number so we can easily compare them and clean
  # up repeated images.
  #
  if [[ ${#imgs_to_copy} > 1 ]]
  then
    cnt=1
    for img in "${imgs_to_copy[@]}"
    do
      base_img="$(basename "$img")"
      cp -v "$img" "./__assets/${base_img/./____$cnt.}"
      ((cnt+=1))
    done
  else
    cp -v "$img" "./__assets/$img"
  fi
done
