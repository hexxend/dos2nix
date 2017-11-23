#!/bin/bash
# converts dos text files to unix style
# hexxend

if [[ $1 == "-h"  ||  $1 == "--help" ]]; then # check if the user is looking for help
    echo -e 'usage: dos2unix.sh infile outfile\n converts a text file with dos retrun newline to unix stule newline'
elif [ -z $1 ] || [ -z $2 ]; then             # check if the user forgot to pass arguments
    echo "Input and Output files required"
elif [[ $1 && $2 ]]; then                     # replace \r\n with \n
   awk '{ sub("\r$", "" ); print }' $1 > $2
else                                          # print any errors
    $0 2>&1 
fi
