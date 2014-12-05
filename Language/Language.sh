#!/bin/bash

##Fixes related to language

#Spellcheck "Spanish"

sed -i "s:Spanish:Spanish:I" "$CORRECTED"

#Spellcheck "English"

sed -i "s:English:English:I" "$CORRECTED"

#Spellcheck "French"

sed -i "s:French:French:I" "$CORRECTED"

#Spellcheck "Greek"

sed -i "s:Greek:Greek:I" "$CORRECTED"

#Spellcheck "Chinese"

sed -i "s:Chinese:Chinese:I" "$CORRECTED"

#Spellcheck "Hebrew"

sed -i "s:Hebrew:Hebrew:I" "$CORRECTED"

#Spellcheck "verb"

sed -i "s:\bvreb:verb:I" "$CORRECTED"