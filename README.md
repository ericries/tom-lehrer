# tom-lehrer
Complete archive of Tom Lehrer's songs, sheet music, and web content following his 2022 public domain release

content downloaded 12/2022 with:

`wget --recursive --no-clobber --page-requisites --convert-links --html-extension https://tomlehrersongs.com/`

songbook created with ghostscript, see: scripts/gs.sh

you can download the latest songbook PDF from: https://github.com/ericries/tom-lehrer/releases

if you have xpdf installed, you should see this when running pdfinfo
on songbook.pdf:
```
$ pdfinfo songbook.pdf 

Title:          If He Could Only See Us: The Complete Public Domain Tom Lehrer Songbook
Subject:        The Complete Public Domain Tom Lehrer Songbook
Keywords:       Tom Lehrer, Songbook, Sheet Music, Lyrics
Author:         Tom Lehrer
Creator:        github tom-lehrer project
Producer:       GPL Ghostscript 10.00.0
CreationDate:   Mon Jan  2 16:11:08 2023
ModDate:        Mon Jan  2 16:11:08 2023
Tagged:         no
Form:           none
Pages:          320
Encrypted:      no
Page size:      612 x 792 pts (letter) (rotated 0 degrees)
File size:      96859629 bytes
Optimized:      no
PDF version:    1.3
```


MacOS:
```
brew install gs xpdf
git clone https://github.com/ericries/tom-lehrer.git
cd tom-lehrer
sh scripts/gs.sh
```

Table of Contents generated with pandoc and mactex:
```
brew install pandoc mactex
sh scripts/gentoc.sh
open assets/Table-of-Contents.pdf
```

Generate all frontmatter, including TOC, pdfmark and Disclaimer page:
```
sh scripts/frontmatter.sh
```

TODOs:
- use Github Actions to auto-generate songbook - DONE, see .github/workflows/static.yml
- figure out gs parameters to make songbook usable with Amazon KDP
- host backup copy of website on Github Pages
- add metadata to PDF generation using gs - DONE assets/metadata.pdfmark
- use gs to add page numbers to songbook on alternating pages - DONE using gs, see scripts/gs.sh
- do a proper title sort rather than primitive sort -f - DONE using sed
- add pdfmark TOC to final PDF with correct page numbers - DONE see scripts/toc.sh
- generate TOC in PDF form, add to frontmatter with correct page numbers - DONE using pandoc, see scripts/gentoc.sh
- get markdown -> PDF working - DONE using pandoc and mactex
- refactor bash scripts to reuse common bits instead of copy-paste
- render the public domain disclaimer for print and add to PDF - DONE,  see scripts/frontmatter.sh
- explore other print-on-demand publishers other than KDP, perhaps lulu.com
- create basic frontmatter (title page, disclaimer, TOC) - DONE
- create good-looking frontmatter and title page 
- convert assets/frontmatter.pdf to PDF/X 
