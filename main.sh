#! /bin/bash

#dependencies
echo 'Scrot should be installed (if no then: apt install scrot)'
read

#initial variables
read -r -e -p 'Directory of the handshake file: ' DIR_OF_HANDSHAKE

read -r -e -p 'Directory of the folder containing wordlists: ' DIR_OF_WORDLISTS

read -r -e -p 'Where to save the screenshots taken by scrot? (remeber to add an / at the end) ' DIR_OF_SCREENSHOTS

#saving the list of wordlists txt files in a file
cd "$DIR_OF_WORDLISTS"

ls -1 >>file_names1.txt
grep -v 'file_names1.txt' file_names1.txt >>file_names2.txt

# running aircrack-ng
clear

NUM_OF_WORDLISTS=$(cat file_names2.txt | wc -l) #getting the total num of wordlists txt files in file_names2.txt

for files in $(seq 1 $NUM_OF_WORDLISTS); do
    CURRENT_WORDLIST=$(sed $files'!d' file_names2.txt) #setting the wordlist file name

    aircrack-ng -w $CURRENT_WORDLIST $DIR_OF_HANDSHAKE
    echo 'ran through wordlist: ' $CURRENT_WORDLIST

    scrot -d 10 -z $DIR_OF_SCREENSHOTS'%Y-%m-%d-%H-%M'
    mkdir ran_through_wordlists
    mv $CURRENT_WORDLIST ran_through_wordlists

    clear

done

#deleting junk files
cd "$DIR_OF_WORDLISTS"
rm file_names1.txt
rm file_names2.txt
