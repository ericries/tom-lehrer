#!/bin/sh

sh scripts/tocmd.sh > assets/toc.md
pandoc -V pagestyle=empty -o assets/Table-of-Contents.pdf assets/toc.md  
pdfinfo assets/Table-of-Contents.pdf
