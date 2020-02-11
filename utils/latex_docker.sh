mkdir -p build
exec docker run --name latexmk_$(basename $PWD) --rm -v ${PWD}:/data thubo/latexmk -pdf -f -outdir=build "$1"
