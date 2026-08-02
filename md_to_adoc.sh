#!/bin/bash

#
# Make sure to install the the required ruby gems:
#
#    $ gem install kramdown kramdown-asciidoc
#
#

usage () {
  cat <<EOF

+---------------------------------------------------------+
| Provide two parameters:                                 |
|                                                         |
|   • The path to the input .md file, e.g.:               |
|                                                         |
|       ~/source/backup/sed/intro.md                      |
|                                                         |
|   • The path to the output .adoc file, .e.g.:           |
|                                                         |
|       ~/source/dev/sed/intro.adoc                       |
|                                                         |
| NOTE                                                    |
| ====                                                    |
|                                                         |
| If the output file is in a directory that doesn't exist |
| yet, it is created automatically for you.               |
+---------------------------------------------------------+
EOF

  exit 1
}

function error_file_out_adoc_exists () {
  file_that_already_exists="$1"

  1>&2 cat << EOF

Error:

  $file_that_already_exists"

File exists and is not empty. Refusing to override. Stopping!
EOF
  exit 1
}

if [[ $# != 2 ]]
then
  usage
fi

file_in_md="$1"
file_out_adoc="$2"
dir_out="${file_out_adoc%/*}"

if [[ ! -w $dir_out ]]
then
  printf '\nCreating directory:\n\n  %s\n\n' "$dir_out"
  mkdir -pv "$dir_out"
fi

if [[ -s $file_out_adoc ]]
then
  error_file_out_adoc_exists "$file_out_adoc"
fi


kramdoc \
  --format=GFM \
  --output="$file_out_adoc" \
  --wrap=ventilate "$file_in_md"

cat << EOF

Converted file written to:

  "$file_out_adoc"

EOF
