#!/bin/bash

##Fixes related to Costa Rica

#Spellcheck "Costa Rica"

sed -i "s:\bCostaRica:Costa Rica:I" "$CORRECTED"
sed -i "s:\bCosta Rica: Costa Rica:I" "$CORRECTED"