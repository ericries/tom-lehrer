#!/bin/sh

# pagestyle=empty courtesy of https://tex.stackexchange.com/questions/138651/pandoc-markdown-to-pdf-without-page-numbers
# pandoc on MacOS courtesy of https://code.haleby.se/2017/01/27/markdown-to-pdf-in-macosx/

sh scripts/toc.sh > assets/toc.pdfmark
sh scripts/tocmd.sh > assets/toc.md
pandoc -V pagestyle=empty -o assets/Table-of-Contents.pdf assets/toc.md  
pdfinfo assets/Table-of-Contents.pdf
pandoc -V pagestyle=empty -o assets/Disclaimer.pdf assets/disclaimer.md  
pdfinfo assets/Disclaimer.pdf
