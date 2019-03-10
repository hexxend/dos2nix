#!/bin/bash
# converts dos text files to unix style

#Copyright (c) 2019 HexXend
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#1. Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#2. Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
#IMPLIEDWARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
#AREDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
#LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
#CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
#SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
#INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
#CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
#ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
#THE POSSIBILITY OF SUCH DAMAGE.
#
#The views and conclusions contained in the software and documentation are 
#those of the authors and should not be interpreted as representing official 
#policies, either expressed or implied, of the dos2nix project.

if [[ $1 == "-h"  ||  $1 == "--help" ]]; then # check if the user is looking for help
    echo -e 'usage: dos2unix.sh infile outfile\n converts a text file with dos retrun newline to unix stule newline'
elif [ -z $1 ] || [ -z $2 ]; then             # check if the user forgot to pass arguments
    echo "Input and Output files required"
elif [[ $1 && $2 ]]; then                     # replace \r\n with \n
   awk '{ sub("\r$", "" ); print }' $1 > $2
else                                          # print any errors
    $0 2>&1 
fi
