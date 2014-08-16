#!/bin/bash

###Fixes related to India

#Spellcheck "India"

sed -i "s:\bIndia\b:India:I" "$CORRECTED"
sed -i "s:\bIndias\b:India's:I" "$CORRECTED"