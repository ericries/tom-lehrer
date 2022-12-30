# tom-lehrer
Complete archive of Tom Lehrer's songs, sheet music, and web content following his 2022 public domain release

content downloaded 12/2022 with:

`wget --recursive --no-clobber --page-requisites --convert-links --html-extension https://tomlehrersongs.com/`

songbook created with gs, see: scripts/gs.sh

MacOS:
```
brew install gs xpdf
git clone https://github.com/ericries/tom-lehrer.git
cd tom-lehrer
sh scripts/gs.sh
```

TODOs:
- use Github Actions to auto-generate songbook 
- figure out gs parameters to make songbook usable with Amazon KDP
- host backup copy of website on Pages
- add metadata to PDF generation using gs
- use gs to add page numbers to songbook on alternating pages
- create good-looking frontmatter and TOC
- do a proper title sort rather than primitive sort -f

