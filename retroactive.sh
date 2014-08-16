#!/bin/bash

#Script to run the bot and make changes on older pages, either from a specified category or from all pages on the site

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

if [ "$1" != "" ];
then
  python $PYWIKIPEDIADIR/pagegenerators.py -cat:"$1" -pt:$GBT -ns:0 > "$NEWPAGES"
else
  python $PYWIKIPEDIADIR/pagegenerators.py -start:'$' -pt:$GBT -ns:0 > "$NEWPAGES"
fi

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

if [ "$1" != "" ];
then
  sdiff -s "$NEWPAGES" "$CORRECTED" > "$PATCH"
else
  sdiff -sH "$NEWPAGES" "$CORRECTED" > "$PATCH" #Use large file mode if running on entire site
fi

sed -i "s:|::g" "$PATCH" #removes pipe character
movepages "$PATCH"
md5sum "$CORRECTED" > MD5SUM

#Cleanup

rm "$NEWPAGES"
rm "$CORRECTED"
rm "$PATCH"
