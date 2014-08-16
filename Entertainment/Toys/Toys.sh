#!/bin/bash

#Fixes spellign errors related to toys

#Spellcheck "Tamagotchi"

sed -i "s:Tamagotchi:Tamagotchi:I" $CORRECTED
sed -i "s:tomogotchi:Tamagotchi:I" $CORRECTED
sed -i "s:Tamagatchi:Tamagotchi:I" $CORRECTED
sed -i "s:tamogotchi:Tamagotchi:I" $CORRECTED

#Spellcheck "Hello Kitty"

sed -i "s:Hello Kitty:Hello Kitty:I" $CORRECTED
sed -i "s:helloKitty:Hello Kitty:I" $CORRECTED

#Spellcheck "Hot Wheels"

sed -i "s:Hot Wheels:Hot Wheels:I" $CORRECTED
sed -i "s: HotWheels : Hot Wheels :I" $CORRECTED

#Spellcheck "Beanie Babies"

sed -i "s:Beanie Babies:Beanie Babies:I" "$CORRECTED"
sed -i "s:BeanieBabies:Beanie Babies:I" "$CORRECTED"
sed -i "s:Beanie Baby:Beanie Baby:I" "$CORRECTED"
sed -i "s:BeanieBaby:Beanie Baby:I" "$CORRECTED"

#Spellcheck "Webkinz"

sed -i "s: Webkinz: Webkinz:I" $CORRECTED