#!/bin/bash

##Fixes related to Astronomy

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