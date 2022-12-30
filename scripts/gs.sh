#!/bin/sh
echo "searching directory tomlehrersongs.com for PDF files"
count=`find tomlehrersongs.com -name "*.pdf" | sort -f -t'/' -k6 | wc -l`
echo "found $count PDF files"
listfiles=`find tomlehrersongs.com -name "*.pdf" | sort -f -t'/' -k6`
DEFAULTVALUE="songbook.pdf"
output_file="${1:-$DEFAULTVALUE}"

echo "using frontmatter from assets/frontmatter.pdf"
echo "using metadata from assets/metadata.pdfmark"
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
        setpagedevice' -f assets/frontmatter.pdf $listfiles assets/metadata.pdfmark

echo "complete. songbook $output_file metadata:"
pdfinfo -box -meta $output_file

echo "opening in preview"
open $output_file
