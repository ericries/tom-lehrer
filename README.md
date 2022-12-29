# tom-lehrer
Complete archive of Tom Lehrer's songs, sheet music, and web content following his 2022 public domain release

content downloaded 12/2022 with:

`wget --recursive --no-clobber --page-requisites --convert-links --html-extension https://tomlehrersongs.com/`

songbook created with gs:
```
mkdir /tmp/pdfs
find . -name '*.pdf' -exec cp "{}" /tmp/pdfs \;
cd /tmp/pdfs
ls | sort -f | xargs gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite
-sOutputFile=songbook.pdf -dPDFX -sColorConversionStrategy=Gray
-dDEVICEWIDTHPOINTS=612 -dDEVICEHEIGHTPOINTS=792 -dFIXEDMEDIA
-dPDFFitPage -dUseCropBox assets/metadata.pdfmark
ls -lh songbook.pdf
```

TODOs:
- use Github Actions to auto-generate songbook 
- figure out gs parameters to make songbook usable with Amazon KDP
- host backup copy of website on Pages
- add metadata to PDF generation using gs
