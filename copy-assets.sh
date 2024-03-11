#!/bin/bash

assets_dir=($(find ./docs -type d -name __assets -print))

for asset_dir in "${assets_dir[@]}"
do
  cp -rv "$asset_dir" "${asset_dir/docs/public}"
done
