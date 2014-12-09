#!/bin/bash

###Fixes spelling of basic English words

#Spellcheck lowercase single "I"

sed -i "s:\bi\b:I:g" "$CORRECTED"

#Spellcheck "Don't"

sed -i "s:\bdont\b:don't:g" "$CORRECTED"
sed -i "s:\bDont\b:Don't:g" "$CORRECTED"

#Spellcheck "Won't"

sed -i "s:\bwont\b:won't:g" "$CORRECTED"
sed -i "s:\bWont\b:Won't:g" "$CORRECTED" 

#Spellcheck misspelled word "when"

sed -i "s:\bwen\b:when:I" "$CORRECTED"
sed -i "s:\.When:. When:I" "$CORRECTED"
sed -i "s:\. When:. When:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "what"

sed -i "s:\bwat\b:what:" "$CORRECTED"
sed -i "s:\bwht\b:what:" "$CORRECTED"
sed -i "s:\behat\b:what:" "$CORRECTED"
sed -i "s:\bwaht\b:what:" "$CORRECTED"
sed -i "s:^wat\b:what:I" "$CORRECTED"
sed -i "s:^wht\b:what:I" "$CORRECTED"
sed -i "s:^ehat\b:what:I" "$CORRECTED"
sed -i "s:^waht\b:what:I" "$CORRECTED"
sed -i "s:^whais\b:What is:I" "$CORRECTED"
sed -i "s:\.What:. What:I" "$CORRECTED"
sed -i "s:\. What:. What:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "Where"

sed -i "s:\bwher\b:where:I" "$CORRECTED"
sed -i "s:were does:where does:I" "$CORRECTED"
sed -i "s:\.Where:. Where:I" "$CORRECTED"
sed -i "s:\. Where:. Where:I" "$CORRECTED" #Fixes start of new sentence

#Spellcheck "How"

sed -i "s:^Ho do:How do:I" "$CORRECTED"

#Spellcheck "Which"

sed -i "s:^Whch\b:Which:I" "$CORRECTED"

#spellcheck "You"

sed -i "s:Wii U :Wii UTemp:I" "$CORRECTED" #Temporary fix
sed -i "s: u : you :I" "$CORRECTED"
sed -i "s:Wii UTemp:Wii U :I" "$CORRECTED" #Put back

#Spellcheck "Can't"

sed -i "s:\bc[aA][nN][tT]:can't:" "$CORRECTED"

