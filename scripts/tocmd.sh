#!/bin/bash
# requires xpdf, install with brew install xpdf

listfiles=$'assets/frontmatter.pdf\nassets/Disclaimer.pdf\nassets/Table-of-Contents.pdf\n'
listfiles+=`find tomlehrersongs.com -name "*.pdf" | sed -E -e 's/(.+)\/((the-|a-)?([^ ]*))/\4 \1\/\3\4/' | sort -f | sed -E -e 's/[^ ]+ //'`

# courtesy https://stackoverflow.com/questions/35006611/how-to-convert-text-following-title-case-rules-in-bash
tc() {
echo "$@" | awk 'BEGIN{split("a the to at in on from with and but or of is",w); for(i in w)nocap[w[i]]}function cap(word){return toupper(substr(word,1,1)) tolower(substr(word,2))}{for(i=1;i<=NF;++i){printf "%s%s",(i==1||i==NF||!(tolower($i) in nocap)?cap($i):tolower($i)),(i==NF?"\n":" ")}}'
}


echo "% Songs and Lyrics\n% by Tom Lehrer\n\n"

# courtesy of https://tex.stackexchange.com/questions/44280/pagestyleempty-doesnt-seem-to-work-for-page-with-maketitle/44281#44281
printf '\\thispagestyle{empty}\n\n'

runningcount=1
while IFS= read -r line ; do
    songname=$(basename $line .pdf | sed "s/-/ /g")
    songname=$(tc $songname)
    pagecount=$(/opt/homebrew/bin/pdfinfo $line | grep Pages: | grep -o -E '[0-9]+')
    #echo "$pagecount / $runningcount"

    # if you want to generate dots with bash instead of LaTeX
    #songlen=${#songname}
    #width=70
    #dotline=$(printf "%0.s." $(seq 1 $((width-songlen))))

    # hfill courtesy https://tex.stackexchange.com/questions/641048/how-to-right-align-the-last-line-of-a-block-of-text
    # nbsp courtesy of https://stackoverflow.com/questions/40023013/tab-space-in-markdown
    # dotfill courtesy of https://tex.stackexchange.com/questions/38423/want-to-fill-line-with-repeating-string
    echo "$songname \dotfill &nbsp; $runningcount\n"
    runningcount=$((runningcount+pagecount))

done <<< "$listfiles"

