#!/bin/bash

#
# This script must be run _after_ the main building of the pages
# with AdocWiki is performed and the build/ directory contains
# all the generated HTML pages.
#

##
# Create an array with all __asset directories.
#
asset_dirs=($(find ./docs -type d -name __assets -print))

##
# Copy assets to build directory for each category.
#
for asset_dir in "${asset_dirs[@]}"
do
  cp -rv "$asset_dir" "${asset_dir/docs/build}"
done

##
# Copy the global assets.
#
mkdir -pv ./build/__assets
cp -v ./docs/__assets/* ./build/__assets/

##
# Generate simple sitemap.txt file on build directory.
#
printf '%s\n' ./build/**/*.html \
  | sed 's@^\./build/@https:\/\/devhowto.gitlab.io/@' \
  1> ./sitemap.txt

cp -v ./sitemap.txt ./build

##
# Copy google verification to build directory.
#
cp -v ./google4e1c1c5cc9907ad4.html ./build
cp -v ./robots.txt ./build
