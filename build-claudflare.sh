#!/bin/bash

gem install bundler
bundle install
git --version
ruby --version
asciidoctor --version
git clone --depth 1 https://gitlab.com/fernandobasso/adocwiki.git ./adocwiki
echo $PWD
ls -l $PWD/adocwiki
ruby $PWD/adocwiki/src/main.rb $PWD
bash ./copy_assets.sh
mv -v ./build ./public
