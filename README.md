# tom-lehrer
Complete archive of Tom Lehrer's songs, sheet music, and web content following his 2022 public domain release

content downloaded 12/2022 with:

`wget --recursive --no-clobber --page-requisites --convert-links --html-extension https://tomlehrersongs.com/`

songbook created with ghostscript, see: scripts/gs.sh

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


TODOs:
- use Github Actions to auto-generate songbook - DONE
- figure out gs parameters to make songbook usable with Amazon KDP
- host backup copy of website on Github Pages
- add metadata to PDF generation using gs - DONE assets/metadata.pdfmark
- use gs to add page numbers to songbook on alternating pages - DONE using gs, see scripts/gs.sh
- create good-looking frontmatter and title page
- do a proper title sort rather than primitive sort -f - DONE using sed
- add pdfmark TOC to final PDF with correct page numbers - DONE see scripts/toc.sh
- generate TOC in PDF form, add to frontmatter with correct page numbers - DONE using pandoc, see scripts/gentoc.sh
- get markdown -> PDF working - DONE using pandoc and mactex
- refactor bash scripts to reuse common bits instead of copy-paste
- render the public domain disclaimer for print and add to PDF - DONE,  see scripts/frontmatter.sh
