#!/bin/bash

##Fixes related to government"

GOVERNMENTDIR="./Government"

. "$GOVERNMENTDIR/Countries/Countries.sh"

#Spellcheck "government"

sed -i "s:goverment:government:g" "$CORRECTED"

#Spellcheck "feudalism"
#Feudalism is also the name of a game, so we'll preserve the case of the first letter

sed -i "s:f[eE][uU][dD][aA][lL][sS][iI][mM]:feudalism:" "$CORRECTED"
sed -i "s:F[eE][uU][dD][aA][lL][sS][iI][mM]:Feudalism:" "$CORRECTED"
