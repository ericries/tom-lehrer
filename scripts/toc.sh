#!/bin/bash
# requires xpdf, install with brew install xpdf

listfiles=$'assets/frontmatter.pdf\nassets/Disclaimer.pdf\nassets/Table-of-Contents.pdf\n'
listfiles+=`find tomlehrersongs.com -name "*.pdf" | sed -E -e 's/(.+)\/((the-|a-)?([^ ]*))/\4 \1\/\3\4/' | sort -f | sed -E -e 's/[^ ]+ //'`

# courtesy https://stackoverflow.com/questions/35006611/how-to-convert-text-following-title-case-rules-in-bash
tc() {
echo "$@" | awk 'BEGIN{split("a the to at in on from with and but or of",w); for(i in w)nocap[w[i]]}function cap(word){return toupper(substr(word,1,1)) tolower(substr(word,2))}{for(i=1;i<=NF;++i){printf "%s%s",(i==1||i==NF||!(tolower($i) in nocap)?cap($i):tolower($i)),(i==NF?"\n":" ")}}'
}


runningcount=1
while IFS= read -r line ; do
    songname=$(basename $line .pdf | sed "s/-/ /g")
    songname=$(tc $songname)
    pagecount=$(/opt/homebrew/bin/pdfinfo $line | grep Pages: | grep -o -E '[0-9]+')
    #echo "$pagecount / $runningcount"
    echo "[/Title ($songname) /Page $runningcount /OUT pdfmark"
    runningcount=$((runningcount+pagecount))

done <<< "$listfiles"

