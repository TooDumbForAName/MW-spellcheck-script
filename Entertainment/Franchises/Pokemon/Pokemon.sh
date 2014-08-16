#!/bin/bash

#Fixes for Pokémon names and games

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