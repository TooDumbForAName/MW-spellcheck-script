#!/bin/bash

##Fixes for common words that don't fall under any other category

#Spellcheck "happened"

sed -i "s:happend:happened:I" "$CORRECTED"

#Spellcheck "Region"

sed -ir "s:\bR[eE][iI][gG][oO][nN]:Region:" "$CORRECTED"
sed -ir "s:\br[eE][iI][gG][oO][nN]:region:" "$CORRECTED"