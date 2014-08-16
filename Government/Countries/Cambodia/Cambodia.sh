#!/bin/bash

##Fixes related to Cambodia

#Spellcheck "Cambodia"

sed -i "s:Cambodia:Cambodia:I" "$CORRECTED"
sed -i "s:Cambodias:Cambodia's:I" "$CORRECTED"

#Spellcheck "Angkor Wat"

sed -i "s:Angkor What:Angkor Wat:I" "$CORRECTED"