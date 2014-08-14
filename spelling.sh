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


#Spellcheck lowercase single "I"


sed -i "s:\bi\b:I:g" "$CORRECTED"

#Spellcheck "Don't"

sed -i "s:\bdont\b:don't:g" "$CORRECTED"
sed -i "s:\bDont\b:Don't:g" "$CORRECTED"

#Spellcheck "Won't"

sed -i "s:\bwont\b:won't:g" "$CORRECTED"
sed -i "s:\bWont\b:Won't:g" "$CORRECTED" 

#Spellcheck "iPod"

sed -i "s:ipod:iPod:I" "$CORRECTED"

#Spellcheck "iPhone"

sed -i "s:iphone:iPhone:I" "$CORRECTED"

#Spellcheck misspelled word "when"

sed -i "s:\bwen\b:when:I" "$CORRECTED"
sed -i "s:\.When:. When:I" "$CORRECTED"
sed -i "s:\. When:. When:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "Alabama"

sed -i "s:Alabama:Alabama:I" "$CORRECTED"
sed -i "s:Alabamas:Alabama's:I" "$CORRECTED"

#Spellcheck "Alaska"

sed -i "s:Alaska:Alaska:I" "$CORRECTED"
sed -i "s:Alaskas:Alaska's:I" "$CORRECTED"

#Spellcheck "Arizona"

sed -i "s:Arizona:Arizona:I" "$CORRECTED"
sed -i "s:Arizonas:Arizona's:I" "$CORRECTED"

#Spellcheck "Arkansas"

sed -i "s:Arkansas:Arkansas:I" "$CORRECTED"
sed -i "s:Arkansass:Arkansas':I" "$CORRECTED"

#Spellcheck "California"

sed -i "s:california:California:I" "$CORRECTED"
sed -i "s:Californias:California's:I" "$CORRECTED"

#Spellcheck "Colorado"

sed -i "s:Colorado:Colorado:I" "$CORRECTED"
sed -i "s:Colorados:Colorado's:I" "$CORRECTED"

#Spellcheck "Montana"

sed -i "s:montana:Montana:I" "$CORRECTED"
sed -i "s:Montanas:Montana's:I" "$CORRECTED"

#Spellcheck "Texas"

sed -i "s:Texas:Texas:I" "$CORRECTED"
sed -i "s:Texass:Texas's:I" "$CORRECTED"

#Spellcheck "Wyoming"

sed -i "s:Wyoming:Wyoming:I" "$CORRECTED"
sed -i "s:Wyomings:Wyoming's:I" "$CORRECTED"

#Spellcheck "Canada"

sed -i "s:\bCanada:Canada:I" "$CORRECTED"

#Spellcheck "Costa Rica"

sed -i "s:\bCostaRica:Costa Rica:I" "$CORRECTED"
sed -i "s:\bCosta Rica: Costa Rica:I" "$CORRECTED"

#Spellcheck "India"

sed -i "s:\bIndia\b:India:I" "$CORRECTED"
sed -i "s:\bIndias\b:India's:I" "$CORRECTED"

#Spellcheck "Pakistan"

sed -i "s:\bPakistan:Pakistan:I" "$CORRECTED"
sed -i "s:\bPakistans:Pakistan's:I" "$CORRECTED"

#Spellcheck "French"

sed -i "s:French Revolution:French Revolution:I" "$CORRECTED"
sed -i "s:French:French:I" "$CORRECTED"

#Spellcheck "feudalism"
#Feudalism is also the name of a game, so we'll preserve the case of the first letter

sed -i "s:f[eE][uU][dD][aA][lL][sS][iI][mM]:feudalism:" "$CORRECTED"
sed -i "s:F[eE][uU][dD][aA][lL][sS][iI][mM]:Feudalism:" "$CORRECTED"

#Spellcheck "Spanish"

sed -i "s:Spanish:Spanish:I" "$CORRECTED"

#Spellcheck "English"


sed -i "s:English:English:I" "$CORRECTED"

#Spellcheck "American"

sed -i "s:American Revolution:American Revolution:I" "$CORRECTED"
sed -i "s:American:American:I" "$CORRECTED"

#Spellcheck "Houston"

sed -i "s:Houston:Houston:I" "$CORRECTED"
sed -i "s:Houstons:Houston's:I" "$CORRECTED"

#Spellcheck "Tucson"

sed -i "s:Tucson:Tucson:I" "$CORRECTED"
sed -i "s:Tucsons:Tucson's:I" "$CORRECTED"

#Spellcheck "what"

sed -i "s:\bwat\b:what:" "$CORRECTED"
sed -i "s:\bwht\b:what:" "$CORRECTED"
sed -i "s:\behat\b:what:" "$CORRECTED"
sed -i "s:\bwaht\b:what:" "$CORRECTED"
sed -i "s:^wat\b:what:I" "$CORRECTED"
sed -i "s:^wht\b:what:I" "$CORRECTED"
sed -i "s:^ehat\b:what:I" "$CORRECTED"
sed -i "s:^waht\b:what:I" "$CORRECTED"
sed -i "s:^whais\b:What is:I" "$CORRECTED"
sed -i "s:\.What:. What:I" "$CORRECTED"
sed -i "s:\. What:. What:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "Where"

sed -i "s:\bwher\b:where:I" "$CORRECTED"
sed -i "s:were does:where does:I" "$CORRECTED"
sed -i "s:\.Where:. Where:I" "$CORRECTED"
sed -i "s:\. Where:. Where:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "How"

sed -i "s:^Ho do:How do:I" "$CORRECTED"

#Spellcheck "Which"

sed -i "s:^Whch\b:Which:I" "$CORRECTED"

#spellcheck "You"

sed -i "s:Wii U :Wii UTemp:I" "$CORRECTED" #Temporary fix
sed -i "s: u : you :I" "$CORRECTED"
sed -i "s:Wii UTemp:Wii U :I" "$CORRECTED" #Put back

#Spellcheck "Can't"

sed -i "s:\bc[aA][nN][tT]:can't:" "$CORRECTED"

#Spellcheck "Pokémon"

sed -i "s:Pokemon:Pokémon:I" "$CORRECTED"
sed -i "s:Pokémon:Pokémon:I" "$CORRECTED"

#Spellcheck "Pokémon Black" 

sed -i "s:Pokémon Black:Pokémon Black:I" "$CORRECTED"
sed -i "s:PokémonBlack:Pokémon Black:I" "$CORRECTED"
sed -i "s:Pokémon Black2:Pokémon Black 2:I" "$CORRECTED"

#Spellcheck "Pokémon White"

sed -i "s:Pokémon White:Pokémon White:I" "$CORRECTED"
sed -i "s:Pokémon Whte:Pokémon White:I" "$CORRECTED"
sed -i "s:PokémonWhite:Pokémon White:I" "$CORRECTED"
sed -i "s:Pokémon White2:Pokémon White 2:I" "$CORRECTED"

#Spellcheck "Pokémon Diamond"

sed -i "s:Pokémon Dimond:Pokémon Diamond:I" "$CORRECTED"
sed -i "s:PokémonDimond:Pokémon Diamond:I" "$CORRECTED"

#Spellcheck "Pokémon Pearl"

sed -i "s:Pokémon Pearl:Pokémon Pearl:I" "$CORRECTED"
sed -i "s:PokémonPearl:Pokémon Pearl:I" "$CORRECTED"
sed -i "s:Pokémon Perl:Pokémon Pearl:I" "$CORRECTED"
sed -i "s:PokémonPerl:Pokémon Pearl:I" "$CORRECTED"

#Spellcheck "Pokémon HeartGold"

sed -i "s:Pokémon HeartGold:Pokémon HeartGold:I" "$CORRECTED"
sed -i "s:Pokémon Heart Gold:Pokémon HeartGold:I" "$CORRECTED"
sed -i "s:PokémonHeartGold:Pokémon HeartGold:I" "$CORRECTED"
sed -i "s:PokémonHeart Gold:Pokémon HeartGold:I" "$CORRECTED"

#Spellcheck "Pokémon Ruby"

sed -i "s:Pokémon Ruby:Pokémon Ruby:I" "$CORRECTED"
sed -i "s:PokémonRuby:Pokémon Ruby:I" "$CORRECTED"

#Spellcheck "Pokémon Sapphire"

sed -i "s:Pokémon Sapphire:Pokémon Sapphire:I" "$CORRECTED"
sed -i "s:PokémonSapphire:Pokémon Sapphire:I" "$CORRECTED"
sed -i "s:PokémonSafire:Pokémon Sapphire:I" "$CORRECTED"
sed -i "s:Pokémon Safire:Pokémon Sapphire:I" "$CORRECTED"
sed -i "s:PokémonSaphire:Pokémon Sapphire:I" "$CORRECTED"
sed -i "s:Pokémon Saphire:Pokémon Sapphire:I" "$CORRECTED"

#Spellcheck "Pokémon Emerald"

sed -i "s:Pokémon Emerald:Pokémon Emerald:I" "$CORRECTED"
sed -i "s:PokémonEmerald:Pokémon Emerald:I" "$CORRECTED"
sed -i "s:PokémonEmrald:Pokémon Emerald:I" "$CORRECTED"
sed -i "s:Pokémon Emrald:Pokémon Emerald:I" "$CORRECTED"

#Spellcheck "Abomasnow"

sed -i "s:Aboamsnow:Abomasnow:I" "$CORRECTED"

#Spellcheck "Abra"

sed -i "s: Abra: Abra:I" "$CORRECTED"

#Spellcheck "Absol"

sed -i "s: Absol : Absol :I" "$CORRECTED"
sed -i "s:Absol :Absol :I" "$CORRECTED"
sed -i "s: Absol$: Absol$:I" "$CORRECTED"

#Spellcheck "Accelgor"

sed -i "s:Accelgor:Accelgor:I" "$CORRECTED"

#Spellcheck "Aegislash"

sed -i "s:Aegislash:Aegislash:I" "$CORRECTED"

#Spellcheck "Legendary"

sed -i "s:l[eE][gG][aA][nN][dD][aA][rR][yY]:legendary:" "$CORRECTED"
sed -i "s:L[eE][gG][aA][nN][dD][aA][rR][yY]:Legendary:" "$CORRECTED"

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

#Spellcheck "Tamagotchi"

sed -i "s:Tamagotchi:Tamagotchi:I" $CORRECTED
sed -i "s:tomogotchi:Tamagotchi:I" $CORRECTED
sed -i "s:Tamagatchi:Tamagotchi:I" $CORRECTED
sed -i "s:tamogotchi:Tamagotchi:I" $CORRECTED

#Spellcheck "Hello Kitty"

sed -i "s:Hello Kitty:Hello Kitty:I" $CORRECTED
sed -i "s:helloKitty:Hello Kitty:I" $CORRECTED

#Spellcheck "Hot Wheels"

sed -i "s:Hot Wheels:Hot Wheels:I" $CORRECTED
sed -i "s: HotWheels : Hot Wheels :I" $CORRECTED

#Spellcheck "Webkinz"

sed -i "s: Webkinz: Webkinz:I" $CORRECTED

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


