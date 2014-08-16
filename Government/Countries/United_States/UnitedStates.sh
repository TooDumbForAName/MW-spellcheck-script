#!/bin/bash

#Fixes related to the United States

#Spellcheck "American"

sed -i "s:American Revolution:American Revolution:I" "$CORRECTED"
sed -i "s:American:American:I" "$CORRECTED"

#Spellcheck "Alabama"

sed -i "s:Alabama:Alabama:I" "$CORRECTED"
sed -i "s:Alabamas:Alabama's:I" "$CORRECTED"

#Spellcheck "Alaska"

sed -i "s:Alaska:Alaska:I" "$CORRECTED"
sed -i "s:Alaskas:Alaska's:I" "$CORRECTED"

#Spellcheck "Arizona"

sed -i "s:Arizona:Arizona:I" "$CORRECTED"
sed -i "s:Arizonas:Arizona's:I" "$CORRECTED"

#Spellcheck "Tucson"

sed -i "s:Tucson:Tucson:I" "$CORRECTED"
sed -i "s:Tucsons:Tucson's:I" "$CORRECTED"

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

#Spellcheck "Houston"

sed -i "s:Houston:Houston:I" "$CORRECTED"
sed -i "s:Houstons:Houston's:I" "$CORRECTED"

#Spellcheck "Wyoming"

sed -i "s:Wyoming:Wyoming:I" "$CORRECTED"
sed -i "s:Wyomings:Wyoming's:I" "$CORRECTED"
