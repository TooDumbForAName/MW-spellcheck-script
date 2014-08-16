#!/bin/bash

##Fixes related to technology

#Spellcheck "iPod"

sed -i "s:ipod:iPod:I" "$CORRECTED"

#Spellcheck "iPhone"

sed -i "s:iphone:iPhone:I" "$CORRECTED"

#Spellcheck "Google"

sed -i "s:Google:Google:I" "$CORRECTED"

#Spellcheck "computer"

sed -i "s:cumputer:computer:I" "$CORRECTED"

#Spellcheck "PHP"

sed -i "s:\bPHP\b:PHP:I" "$CORRECTED"

#Spellcheck "Wikianswers"

sed -i "s:wikianswers:Wikianswers:I" "$CORRECTED"