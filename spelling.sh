#!/bin/bash

#This is the initial script for the automatic spelling fixes script. This automatically renames questions whenever possible to correct spelling and capitalization errors.

#Global settings (for now)

GBT=1
PYWIKIPEDIADIR="../"
BOTNAME="SpellBot"

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

python $PYWIKIPEDIADIR/pagegenerators.py -new:50 -pt:$GBT -ns:0 > newpages.txt
python $PYWIKIPEDIADIR/pagegenerators.py -recentchanges:50 -pt:$GBT -ns:0 >> newpages.txt 
cp newpages.txt newpages-corrected.txt


#Spellcheck lowercase single "I"


sed -i "s:\bi\b:I:g" newpages-corrected.txt

#Spellcheck "Don't"

sed -i "s:\bdont\b:don't:g" newpages-corrected.txt
sed -i "s:\bDont\b:Don't:g" newpages-corrected.txt

#Spellcheck "Won't"

sed -i "s:\bwont\b:won't:g" newpages-corrected.txt
sed -i "s:\bWont\b:Won't:g" newpages-corrected.txt 

#Spellcheck "iPod"

sed -i "s:ipod:iPod:I" newpages-corrected.txt

#Spellcheck "iPhone"

sed -i "s:iphone:iPhone:I" newpages-corrected.txt

#Spellcheck misspelled word "when"

sed -i "s:\bwen\b:when:I" newpages-corrected.txt
sed -i "s:\.When:. When:I" newpages-corrected.txt
sed -i "s:\. When:. When:I" newpages-corrected.txt #Fixes start of new sentence

#Spellcheck "California"

sed -i "s:california:California:I" newpages-corrected.txt
sed -i "s:Californias:California's:I" newpages-corrected.txt

#Spellcheck "Montana"

sed -i "s:montana:Montana:I" newpages-corrected.txt
sed -i "s:Montanas:Montana's:I" newpages-corrected.txt

#Spellcheck "Wyoming"

sed -i "s:Wyoming:Wyoming:I" newpages-corrected.txt
sed -i "s:Wyomings:Wyoming's:I" newpages-corrected.txt

#Spellcheck "Canada"

sed -i "s:\bCanada:Canada:I" newpages-corrected.txt

#Spellcheck "Costa Rica"

sed -i "s:\bCostaRica:Costa Rica:I" newpages-corrected.txt
sed -i "s:\bCosta Rica: Costa Rica:I" newpages-corrected.txt

#Spellcheck "India"

sed -i "s:\bIndia\b:India:I" newpages-corrected.txt
sed -i "s:\bIndias\b:India's:I" newpages-corrected.txt

#Spellcheck "Pakistan"

sed -i "s:\bPakistan:Pakistan:I" newpages-corrected.txt
sed -i "s:\bPakistans:Pakistan's:I" newpages-corrected.txt

#Spellcheck "French"

sed -i "s:French Revolution:French Revolution:I" newpages-corrected.txt
sed -i "s:French:French:I" newpages-corrected.txt

#Spellcheck "feudalism"
#Feudalism is also the name of a game, so we'll preserve the case of the first letter

sed -i "s:f[eE][uU][dD][aA][lL][sS][iI][mM]:feudalism:" newpages-corrected.txt
sed -i "s:F[eE][uU][dD][aA][lL][sS][iI][mM]:Feudalism:" newpages-corrected.txt

#Spellcheck "Spanish"

sed -i "s:Spanish:Spanish:I" newpages-corrected.txt

#Spellcheck "English"


sed -i "s:English:English:I" newpages-corrected.txt

#Spellcheck "American"

sed -i "s:American Revolution:American Revolution:I" newpages-corrected.txt
sed -i "s:American:American:I" newpages-corrected.txt


#Spellcheck "what"

sed -i "s:\bwat\b:what:" newpages-corrected.txt
sed -i "s:\bwht\b:what:" newpages-corrected.txt
sed -i "s:\behat\b:what:" newpages-corrected.txt
sed -i "s:\bwaht\b:what:" newpages-corrected.txt
sed -i "s:^wat\b:what:I" newpages-corrected.txt
sed -i "s:^wht\b:what:I" newpages-corrected.txt
sed -i "s:^ehat\b:what:I" newpages-corrected.txt
sed -i "s:^waht\b:what:I" newpages-corrected.txt
sed -i "s:^whais\b:What is:I" newpages-corrected.txt
sed -i "s:\.What:. What:I" newpages-corrected.txt
sed -i "s:\. What:. What:I" newpages-corrected.txt #Fixes start of new sentence

#Spellcheck "Where"

sed -i "s:\bwher\b:where:I" newpages-corrected.txt
sed -i "s:were does:where does:I" newpages-corrected.txt
sed -i "s:\.Where:. Where:I" newpages-corrected.txt
sed -i "s:\. Where:. Where:I" newpages-corrected.txt #Fixes start of new sentence

#Spellcheck "How"

sed -i "s:^Ho do:How do:I" newpages-corrected.txt

#Spellcheck "Which"

sed -i "s:^Whch\b:Which:I" newpages-corrected.txt

#spellcheck "You"

sed -i "s:Wii U :Wii UTemp:I" newpages-corrected.txt #Temporary fix
sed -i "s: u : you :I" newpages-corrected.txt
sed -i "s:Wii UTemp:Wii U :I" newpages-corrected.txt #Put back

#Spellcheck "Can't"

sed -i "s:\bc[aA][nN][tT]:can't:" newpages-corrected.txt

#Spellcheck "Pokémon"

sed -i "s:Pokemon:Pokémon:I" newpages-corrected.txt
sed -i "s:Pokémon:Pokémon:I" newpages-corrected.txt

#Spellcheck "Pokémon Black" 

sed -i "s:Pokémon Black:Pokémon Black:I" newpages-corrected.txt
sed -i "s:PokémonBlack:Pokémon Black:I" newpages-corrected.txt
sed -i "s:Pokémon Black2:Pokémon Black 2:I" newpages-corrected.txt

#Spellcheck "Pokémon White"

sed -i "s:Pokémon White:Pokémon White:I" newpages-corrected.txt
sed -i "s:Pokémon Whte:Pokémon White:I" newpages-corrected.txt
sed -i "s:PokémonWhite:Pokémon White:I" newpages-corrected.txt
sed -i "s:Pokémon White2:Pokémon White 2:I" newpages-corrected.txt

#Spellcheck "Pokémon Diamond"

sed -i "s:Pokémon Dimond:Pokémon Diamond:I" newpages-corrected.txt
sed -i "s:PokémonDimond:Pokémon Diamond:I" newpages-corrected.txt

#Spellcheck "Pokémon Pearl"

sed -i "s:Pokémon Pearl:Pokémon Pearl:I" newpages-corrected.txt
sed -i "s:PokémonPearl:Pokémon Pearl:I" newpages-corrected.txt
sed -i "s:Pokémon Perl:Pokémon Pearl:I" newpages-corrected.txt
sed -i "s:PokémonPerl:Pokémon Pearl:I" newpages-corrected.txt

#Spellcheck "Pokémon HeartGold"

sed -i "s:Pokémon HeartGold:Pokémon HeartGold:I" newpages-corrected.txt
sed -i "s:Pokémon Heart Gold:Pokémon HeartGold:I" newpages-corrected.txt
sed -i "s:PokémonHeartGold:Pokémon HeartGold:I" newpages-corrected.txt
sed -i "s:PokémonHeart Gold:Pokémon HeartGold:I" newpages-corrected.txt

#Spellcheck "Abomasnow"

sed -i "s:Aboamsnow:Abomasnow:I" newpages-corrected.txt

#Spellcheck "Abra"

sed -i "s: Abra: Abra:I" newpages-corrected.txt

#Spellcheck "Absol"

sed -i "s: Absol : Absol :I" newpages-corrected.txt
sed -i "s:Absol :Absol :I" newpages-corrected.txt
sed -i "s: Absol$: Absol$:I" newpages-corrected.txt

#Spellcheck "Accelgor"

sed -i "s:Accelgor:Accelgor:I" newpages-corrected.txt

#Spellcheck "Aegislash"

sed -i "s:Aegislash:Aegislash:I" newpages-corrected.txt

#Spellcheck "Legendary"

sed -i "s:l[eE][gG][aA][nN][dD][aA][rR][yY]:legendary:" newpages-corrected.txt
sed -i "s:L[eE][gG][aA][nN][dD][aA][rR][yY]:Legendary:" newpages-corrected.txt

#Spellcheck "Miley Cyrus"

sed -i "s:MileyCyrus:Miley Cyrus:I" newpages-corrected.txt
sed -i "s:Miley Cyrus:Miley Cyrus:I" newpages-corrected.txt

#Spellcheck "Venus"

sed -i "s:\bVenus:Venus:I" newpages-corrected.txt

#Spellcheck "Earth"

sed -i "s:\bEarth\b:Earth:I" newpages-corrected.txt

#Spellcheck "Mars"

sed -i "s:\bMars\b:Mars:I" newpages-corrected.txt

#Spellcheck "Jupiter"

sed -i "s:Jupiter:Jupiter:I" newpages-corrected.txt

#Spellcheck "Saturn"

sed -i "s:Saturn:Saturn:I" newpages-corrected.txt

#Spellcheck "Uranus"

sed -i "s:Uranus:Uranus:I" newpages-corrected.txt

#Spellcheck "Neptune"

sed -i "s:Neptune:Neptune:I" newpages-corrected.txt

#Spellcheck "Pluto"

sed -i "s:Pluto\b:Pluto:I" newpages-corrected.txt

#Spellcheck "Christian"

sed -i "s:\bChristian:Christian:I" newpages-corrected.txt

#Spellcheck "Jesus"

sed -i "s:\bJesus:Jesus:I" newpages-corrected.txt

#Spellcheck "Jewish"

sed -i "s:\bJewish:Jewish:I" newpages-corrected.txt

#Spellcheck "Hebrew"

sed -i "s:\bHebrew:Hebrew:I" newpages-corrected.txt

#Spellcheck "Islam" 

sed -i "s:\bIslam:Islam:I" newpages-corrected.txt

#Spellcheck "Muslim"

sed -i "s:Muslim:Muslim:I" newpages-corrected.txt

#Spellcheck "Buddhist"

sed -i "s:\bBuddhist:Buddhist:I" newpages-corrected.txt
sed -i "s:buddist:Buddhist:I" newpages-corrected.txt

#Spellcheck "Hinduism"

sed -i "s:\bHindu:Hindu:I" newpages-corrected.txt
sed -i "s:Hinduism:Hinduism:I" newpages-corrected.txt
sed -i "s:Hinudism:Hinduism:I" newpages-corrected.txt
sed -i "s:Hidusim:Hinduism:I" newpages-corrected.txt
sed -i "s:Hinudsim:Hinduism:I" newpages-corrected.txt

#Spellcheck "Google"

sed -i "s:Google:Google:I" newpages-corrected.txt

#Spellcheck "computer"

sed -i "s:cumputer:computer:I" newpages-corrected.txt

#Spellcheck "verb"

sed -i "s:\bvreb:verb:I" newpages-corrected.txt

#Spellcheck "AdventureQuest Worlds"

sed -i "s:\baqw\b:AdventureQuest Worlds:I" newpages-corrected.txt
sed -i "s:adventure quest worlds:AdventureQuest Worlds:I" newpages-corrected.txt
sed -i "s:AdventureQuest Worlds:AdventureQuest Worlds:I" newpages-corrected.txt


#Spellcheck "Region"

sed -i "s:R[eE][iI][gG][oO][nN]:Region:" newpages-corrected.txt
sed -i "s:r[eE][iI][gG][oO][nN]:region:" newpages-corrected.txt


#Spellcheck "PHP"

sed -i "s:\bPHP\b:PHP:I" newpages-corrected.txt

#Spellcheck "Angkor Wat"

sed -i "s:Angkor What:Angkor Wat:I" newpages-corrected.txt

#Spellcheck "The Sims 2"

sed -i "s:sims 2:The Sims 2:I" newpages-corrected.txt
sed -i "s:sims2:The Sims 2:I" newpages-corrected.txt
sed -i "s:The The Sims 2:The Sims 2:I" newpages-corrected.txt
sed -i "s:TheThe Sims 2:The Sims 2:I" newpages-corrected.txt

#Spellecheck "The Sims 3"

sed -i "s:sims 3:The Sims 3:I" newpages-corrected.txt
sed -i "s:sims3:The Sims 3:I" newpages-corrected.txt
sed -i "s:The The Sims 3:The Sims 3:I" newpages-corrected.txt
sed -i "s:TheThe Sims 3:The Sims 3:I" newpages-corrected.txt

#Spellcheck "Monster Hunter"

sed -i "s:monster hunter:Monster Hunter:I" newpages-corrected.txt
sed -i "s:monsterhunter:Monster Hunter:I" newpages-corrected.txt
sed -i "s:\bmh3:Monster Hunter Tri:I" newpages-corrected.txt
sed -i "s:Monster Hunter Tri:Monster Hunter Tri:I" newpages-corrected.txt

#Spellcheck "RuneScape"

sed -i "s:runescape:RuneScape:I" newpages-corrected.txt

#Spellcheck "Woozworld"

sed -i "s:woozworld:Woozworld:I" newpages-corrected.txt

#Spellcheck "Wikianswers"

sed -i "s:wikianswers:Wikianswers:I" newpages-corrected.txt

#Spellcheck "happened"

sed -i "s:happend:happened:I" newpages-corrected.txt

#Final fixes and merge

addbrackets newpages.txt newpages-corrected.txt

OLDMDSUM=$(cat MD5SUM)
NEWMDSUM=$(md5sum newpages-corrected.txt)

if [ "$OLDMDSUM" != "$NEWMDSUM" ]; #Questions have changed
then
  printf "%s" "$OLDMDSUM"
  printf "%s" "$NEWMDSUM"
  if [ "$(md5sum newpages.txt)" != "$(md5sum newpages-corrected.txt)" ]; #sums are different, so it's worth running
  then
    sdiff -s newpages.txt newpages-corrected.txt > newpages-patch.txt
    sed -i "s:|::g" newpages-patch.txt #removes pipe character
    movepages newpages-patch.txt
    md5sum newpages-corrected.txt > MD5SUM
  fi
fi

#Cleanup
rm ./*.txt

printf "%s" "$(date)" > lastrun


