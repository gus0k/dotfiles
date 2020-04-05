#!/bin/bash
md=myslides.md
template_file=__template.html

reveal_slides=$(pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com | tq .reveal)
reveal_slides_2=${reveal_slides//'class="fragment"'/'class="fragment fade-in-then-semi-out"'}
IFS=
template_text="$(cat ${template_file})"
result=${template_text/__reveal_slides__/$reveal_slides_2}
echo ${result} > slides.html
