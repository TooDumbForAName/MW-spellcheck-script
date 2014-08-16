#!/bin/bash

##Fixes related to Pakistan

#Spellcheck "Pakistan"

sed -i "s:\bPakistan:Pakistan:I" "$CORRECTED"
sed -i "s:\bPakistans:Pakistan's:I" "$CORRECTED"

