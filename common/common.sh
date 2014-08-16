#!/bin/bash

##Fixes for common words that don't fall under any other category

#Spellcheck "happened"

sed -i "s:happend:happened:I" "$CORRECTED"

#Spellcheck "Region"

sed -i "s:R[eE][iI][gG][oO][nN]:Region:" "$CORRECTED"
sed -i "s:r[eE][iI][gG][oO][nN]:region:" "$CORRECTED"