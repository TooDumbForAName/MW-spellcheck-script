#!/bin/bash

#This is the initial script for the automatic spelling fixes script. This automatically renames questions whenever possible to correct spelling and capitalization errors.

#Global settings (for now)

GBT=1
PYWIKIPEDIADIR="../"
BOTNAME="SpellBot"
CORRECTED="/tmp/$PID/newpages-corrected.txt"
NEWPAGES="/tmp/$PID/newpages.txt"
PATCH="/tmp/$PID/patch.txt"

function movepages {
  python  $PYWIKIPEDIADIR/movepages.py -pairs:"$1" -pt:"$GBT" -skipredirects -summary:"[[User:$BOTNAME|$BOTNAME]] - correcting suspected spelling errors. Report any problems [[User talk:$BOTNAME|here]]"
}

function addbrackets {
  sed -i "s:^:\[\[:g" $1
  sed -i "s:^:\[\[:g" $2
  sed -i "s:$:\]\]:g" $1
  sed -i "s:$:\]\]:g" $2
}
#Fetch new pages.

python $PYWIKIPEDIADIR/pagegenerators.py -new:50 -pt:$GBT -ns:0 > "$NEWPAGES"
python $PYWIKIPEDIADIR/pagegenerators.py -recentchanges:50 -pt:$GBT -ns:0 >> "$NEWPAGES" 
cp "$NEWPAGES" "$CORRECTED"


. ./basic/basic.sh
. ./common/common.sh
. ./Entertainment/Entertainment.sh
. ./Government/Government.sh
. ./Science/Science.sh
. ./Technology/Technology.sh

#Spellcheck "Spanish"

sed -i "s:Spanish:Spanish:I" "$CORRECTED"

#Spellcheck "English"

sed -i "s:English:English:I" "$CORRECTED"

#Spellcheck "Miley Cyrus"

sed -i "s:MileyCyrus:Miley Cyrus:I" "$CORRECTED"
sed -i "s:Miley Cyrus:Miley Cyrus:I" "$CORRECTED"

#Spellcheck "verb"

sed -i "s:\bvreb:verb:I" "$CORRECTED"

#Spellcheck "Angkor Wat"

sed -i "s:Angkor What:Angkor Wat:I" "$CORRECTED"

#Final fixes and merge

addbrackets "$NEWPAGES" "$CORRECTED"

OLDMDSUM=$(cat MD5SUM)
NEWMDSUM=$(md5sum "$CORRECTED")

if [ "$OLDMDSUM" != "$NEWMDSUM" ]; #Questions have changed
then
  if [ "$(md5sum "$NEWPAGES")" != "$NEWMDSUM" ]; #sums are different, so it's worth running
  then
    sdiff -s "$NEWPAGES" "$CORRECTED" > "$PATCH"
    sed -i "s:|::g" "$PATCH" #removes pipe character
    movepages "$PATCH"
    md5sum "$CORRECTED" > MD5SUM
    rm "$PATCH"
  fi
fi

#Cleanup

rm "$NEWPAGES"
rm "$CORRECTED"

printf "%s" "$(date)" > lastrun
