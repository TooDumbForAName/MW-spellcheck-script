#!/bin/bash

##Fixes related to Singers

#Spellcheck "Miley Cyrus"

sed -i "s:MileyCyrus:Miley Cyrus:I" "$CORRECTED"
sed -i "s:Miley Cyrus:Miley Cyrus:I" "$CORRECTED"