#!/bin/bash

#This is the initial script for the automatic spelling fixes script. This automatically renames questions whenever possible to correct spelling and capitalization errors.

#Settings

. ./settings.sh

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
. ./Language/Language.sh
. ./Science/Science.sh
. ./Technology/Technology.sh

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
