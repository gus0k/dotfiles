#!/usr/bin/zsh
mkdir -p build
docker run --name latexmk_"$(basename $PWD)" --rm -v "${PWD}":/data -e USER_ID="$(id -u)" -e GROUP_ID="$(id -g)" thubo/latexmk -pdf -f -outdir=build "$1"
