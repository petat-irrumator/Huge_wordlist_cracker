# Huge_wordlist_cracker

a simple bash script that will ask for a handshake file containing valid EAPOL
data and directory of a folder which contains wordlists in text files.
will run the given handshake file against the wordlists in the folder using aircrack-ng
after each run this script will take a screen shot of the screen using scrot(will save the screen shot to a specified directory)(make sure to have it installed using apt install scrot)
and will move the wordlist file that it ran against to a folder in the same directory as the wordlists, named ran_through_wordlists

