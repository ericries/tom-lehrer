#!/bin/sh

# pagestyle=empty courtesy of https://tex.stackexchange.com/questions/138651/pandoc-markdown-to-pdf-without-page-numbers
# pandoc on MacOS courtesy of https://code.haleby.se/2017/01/27/markdown-to-pdf-in-macosx/

echo "Generating pdfmark as assets/toc.pdfmark"
sh scripts/toc.sh > assets/toc.pdfmark

echo "Generating markdown TOC as asset/toc.md"
sh scripts/tocmd.sh > assets/toc.md

# thanks https://stackoverflow.com/questions/39994410/ghostscript-wont-convert-pdf-to-pdf-a-annotation-issue
echo "Generating assets/frontmatter.pdf from assets/Title.pdf"
gs -dPDFA=2 -dBATCH -dNOPAUSE -dPDFACompatibilityPolicy=1 -q -dUseCIEColor -sProcessColorModel=DeviceGray -sDEVICE=pdfwrite -sOutputFile=assets/frontmatter.pdf -f assets/Title.pdf
pdfinfo assets/frontmatter.pdf

echo "using pandoc to generate assets/Table-of-Contents.pdf from assets/toc.md"
pandoc -V pagestyle=empty -o assets/Table-of-Contents.pdf assets/toc.md  
pdfinfo assets/Table-of-Contents.pdf

echo "using pandoc to generate assets/Disclaimer.pdf from assets/disclaimer.md"
pandoc -V pagestyle=empty -o assets/Disclaimer.pdf assets/disclaimer.md  
pdfinfo assets/Disclaimer.pdf
