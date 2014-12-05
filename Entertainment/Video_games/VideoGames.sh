#!/bin/bash

##Fixes related to video games

printf "%s\n" "Starting Video games"

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

#Spellcheck "Woozworld"

sed -i "s:woozworld:Woozworld:I" "$CORRECTED"

#Spellcheck "RuneScape"

sed -i "s:runescape:RuneScape:I" "$CORRECTED"

#Spellcheck "AdventureQuest Worlds"

sed -i "s:\baqw\b:AdventureQuest Worlds:I" "$CORRECTED"
sed -i "s:adventure quest worlds:AdventureQuest Worlds:I" "$CORRECTED"
sed -i "s:AdventureQuest Worlds:AdventureQuest Worlds:I" "$CORRECTED"

#Spellcheck "Studyladder"

sed -i "s:Studdyladder:Studyladder:I" "$CORRECTED"
sed -i "s:Studdy ladder:Studyladder:I" "$CORRECTED"
sed -i "s:Studyladder:Studyladder:I" "$CORRECTED"
sed -i "s:Study ladder:Studyladder:I" "$CORRECTED"

#Spellcheck "Alxemy"

sed -i "s:Alxemy:Alxemy:I" "$CORRECTED"

printf "%s\n" "Finishing Video games"

