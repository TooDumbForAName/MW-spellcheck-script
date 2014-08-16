#!/bin/bash

##Fixes related to Religion

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
