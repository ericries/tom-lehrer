#!/bin/sh
echo "searching directory tomlehrersongs.com for PDF files"

# sort by just the filename, case insensitive, use sed to ignore "the-" and "a-" prefixes
# thanks https://stackoverflow.com/questions/38832855/ignore-optional-leading-string-when-sorting
listfiles=`find tomlehrersongs.com -name "*.pdf" | sed -E -e 's/(.+)\/((the-|a-)?([^ ]*))/\4 \1\/\3\4/' | sort -f | sed -E -e 's/[^ ]+ //'`

#count=`find tomlehrersongs.com -name "*.pdf" | sort -f -t'/' -k6 | wc -l`
count=`echo "$listfiles" | wc -l`
echo "found $count PDF files, sorting alphabetically"

echo "first PDF: $(head -1 <<< "$listfiles")"
echo "last PDF: $(tail -1 <<< "$listfiles")"

DEFAULTVALUE="songbook.pdf"
output_file="${1:-$DEFAULTVALUE}"

echo "using frontmatter from assets/frontmatter.pdf"
echo "using disclaimer statement from assets/Disclaimer.pdf, generate with scripts/frontmatter.sh"
echo "using Table of Contents PDF from assets/Table-of-Contents.pdf, generate with scripts/frontmatter.sh"

# metadata courtesy of https://unix.stackexchange.com/questions/489230/where-is-metadata-for-pdf-files-can-i-insert-metadata-into-any-pdf-file
echo "using metadata from assets/metadata.pdfmark"
echo "using TOC from assets/toc.pdfmark, generate with scripts/toc.sh"


# page numbers courtesy of https://stackoverflow.com/questions/59597599/how-to-add-page-numbers-opposite-the-bound-edge-with-postscript-ghostscript
echo "adding page numbers"


# front matter must be first PDF specified. metadata must be last
echo "running gs to generate songbook filename: $output_file"
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$output_file" -dPDFX -sColorConversionStrategy=Gray -dDEVICEWIDTHPOINTS=612 -dDEVICEHEIGHTPOINTS=792 -dFIXEDMEDIA -dPDFFitPage -dUseCropBox  -c 'globaldict /MyPageCount 1 put
        <<
            /EndPage {
                exch pop 0 eq dup {
                    /Helvetica 12 selectfont MyPageCount 256 string cvs dup stringwidth pop currentpagedevice
                    /PageSize get 0 get exch sub
                    MyPageCount 2 mod 1 eq {
                      60
                    }
                    {
                      555
                    } ifelse
                    sub 9 moveto
                    show globaldict
                    /MyPageCount MyPageCount 1 add put
                } if
            } bind
        >>
        setpagedevice' -f assets/toc.pdfmark assets/frontmatter.pdf assets/Disclaimer.pdf assets/Table-of-Contents.pdf $listfiles assets/metadata.pdfmark 

echo "complete. songbook $output_file metadata:"
ls -lh $output_file
pdfinfo -box -meta $output_file

echo "opening in preview"
open $output_file
