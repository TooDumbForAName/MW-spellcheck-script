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
. ./Entertainment/Entertainment.sh
. ./Government/Government.sh

#Spellcheck "iPod"

sed -i "s:ipod:iPod:I" "$CORRECTED"

#Spellcheck "iPhone"

sed -i "s:iphone:iPhone:I" "$CORRECTED"

#Spellcheck "Spanish"

sed -i "s:Spanish:Spanish:I" "$CORRECTED"

#Spellcheck "English"

sed -i "s:English:English:I" "$CORRECTED"

#Spellcheck "Miley Cyrus"

sed -i "s:MileyCyrus:Miley Cyrus:I" "$CORRECTED"
sed -i "s:Miley Cyrus:Miley Cyrus:I" "$CORRECTED"

#Spellcheck "Venus"

sed -i "s:\bVenus:Venus:I" "$CORRECTED"

#Spellcheck "Earth"

sed -i "s:\bEarth\b:Earth:I" "$CORRECTED"

#Spellcheck "Mars"

sed -i "s:\bMars\b:Mars:I" "$CORRECTED"

#Spellcheck "Jupiter"

sed -i "s:Jupiter:Jupiter:I" "$CORRECTED"

#Spellcheck "Saturn"

sed -i "s:Saturn:Saturn:I" "$CORRECTED"

#Spellcheck "Uranus"

sed -i "s:Uranus:Uranus:I" "$CORRECTED"

#Spellcheck "Neptune"

sed -i "s:Neptune:Neptune:I" "$CORRECTED"

#Spellcheck "Pluto"

sed -i "s:Pluto\b:Pluto:I" "$CORRECTED"

#Spellcheck "Christian"

sed -i "s:\bChristian:Christian:I" "$CORRECTED"

#Spellcheck "Jesus"

sed -i "s:\bJesus:Jesus:I" "$CORRECTED"

#Spellcheck "Jewish"

sed -i "s:\bJewish:Jewish:I" "$CORRECTED"

#Spellcheck "Hebrew"

sed -i "s:\bHebrew:Hebrew:I" "$CORRECTED"

#Spellcheck "Islam" 

sed -i "s:\bIslam:Islam:I" "$CORRECTED"

#Spellcheck "Muslim"

sed -i "s:Muslim:Muslim:I" "$CORRECTED"

#Spellcheck "Buddhist"

sed -i "s:\bBuddhist:Buddhist:I" "$CORRECTED"
sed -i "s:buddist:Buddhist:I" "$CORRECTED"

#Spellcheck "Hinduism"

sed -i "s:\bHindu:Hindu:I" "$CORRECTED"
sed -i "s:Hinduism:Hinduism:I" "$CORRECTED"
sed -i "s:Hinudism:Hinduism:I" "$CORRECTED"
sed -i "s:Hidusim:Hinduism:I" "$CORRECTED"
sed -i "s:Hinudsim:Hinduism:I" "$CORRECTED"

#Spellcheck "Google"

sed -i "s:Google:Google:I" "$CORRECTED"

#Spellcheck "computer"

sed -i "s:cumputer:computer:I" "$CORRECTED"

#Spellcheck "verb"

sed -i "s:\bvreb:verb:I" "$CORRECTED"

#Spellcheck "AdventureQuest Worlds"

sed -i "s:\baqw\b:AdventureQuest Worlds:I" "$CORRECTED"
sed -i "s:adventure quest worlds:AdventureQuest Worlds:I" "$CORRECTED"
sed -i "s:AdventureQuest Worlds:AdventureQuest Worlds:I" "$CORRECTED"


#Spellcheck "Region"

sed -i "s:R[eE][iI][gG][oO][nN]:Region:" "$CORRECTED"
sed -i "s:r[eE][iI][gG][oO][nN]:region:" "$CORRECTED"


#Spellcheck "PHP"

sed -i "s:\bPHP\b:PHP:I" "$CORRECTED"

#Spellcheck "Angkor Wat"

sed -i "s:Angkor What:Angkor Wat:I" "$CORRECTED"

#Spellcheck "The Sims 2"

sed -i "s:sims 2:The Sims 2:I" "$CORRECTED"
sed -i "s:sims2:The Sims 2:I" "$CORRECTED"
sed -i "s:The The Sims 2:The Sims 2:I" "$CORRECTED"
sed -i "s:TheThe Sims 2:The Sims 2:I" "$CORRECTED"

#Spellecheck "The Sims 3"

sed -i "s:sims 3:The Sims 3:I" "$CORRECTED"
sed -i "s:sims3:The Sims 3:I" "$CORRECTED"
sed -i "s:The The Sims 3:The Sims 3:I" "$CORRECTED"
sed -i "s:TheThe Sims 3:The Sims 3:I" "$CORRECTED"

#Spellcheck "Monster Hunter"

sed -i "s:monster hunter:Monster Hunter:I" "$CORRECTED"
sed -i "s:monsterhunter:Monster Hunter:I" "$CORRECTED"
sed -i "s:\bmh3:Monster Hunter Tri:I" "$CORRECTED"
sed -i "s:Monster Hunter Tri:Monster Hunter Tri:I" "$CORRECTED"

#Spellcheck "RuneScape"

sed -i "s:runescape:RuneScape:I" "$CORRECTED"

#Spellcheck "Woozworld"

sed -i "s:woozworld:Woozworld:I" "$CORRECTED"

#Spellcheck "Wikianswers"

sed -i "s:wikianswers:Wikianswers:I" "$CORRECTED"

#Spellcheck "happened"

sed -i "s:happend:happened:I" "$CORRECTED"

#Final fixes and merge

addbrackets "$NEWPAGES" "$CORRECTED"

OLDMDSUM=$(cat MD5SUM)
NEWMDSUM=$(md5sum "$CORRECTED")

if [ "$OLDMDSUM" != "$NEWMDSUM" ]; #Questions have changed
then
  if [ "$(md5sum "$NEWPAGES")" != "$(md5sum "$CORRECTED")" ]; #sums are different, so it's worth running
  then
    sdiff -s "$NEWPAGES" "$CORRECTED" > "$PATCH"
    sed -i "s:|::g" "$PATCH" #removes pipe character
    movepages "$PATCH"
    md5sum "$CORRECTED" > MD5SUM
  fi
fi

#Cleanup

rm "$NEWPAGES"
rm "$CORRECTED"
rm "$PATCH"

printf "%s" "$(date)" > lastrun


