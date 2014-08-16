#!/bin/bash

##Fixes related to France

#Spellcheck "France"

sed -i "s:France:France:I" "$CORRECTED"
sed -i "s:Frances:France's:I" "$CORRECTED"

#Spellcheck "French"

sed -i "s:French Revolution:French Revolution:I" "$CORRECTED"
sed -i "s:FrenchRevolution:French Revolution:I" "$CORRECTED"
sed -i "s:French:French:I" "$CORRECTED"