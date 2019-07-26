#!/bin/sh
# Canary Token Detector
# Version 1.0
# This script will detect canary token in word documents
# Author - Anil Parashar
# www.techchip.net
# www.youtube.com/techchipnet
clear
/bin/cat <<'Techchip'
 _______        _      _____ _     _
|__   __|      | |    / ____| |   (_)
   | | ___  ___| |__ | |    | |__  _ _ __
   | |/ _ \/ __| '_ \| |    | '_ \| | '_ \
   | |  __/ (__| | | | |____| | | | | |_) |
   |_|\___|\___|_| |_|\_____|_| |_|_| .__/
                                    | |
    Your True Tech Navigator        |_|.net
www.techchip.net | youtube.com/techchipnet
Techchip
tput setaf 3
echo ""
echo "Canary Token Detector for Microsoft Word Document"
echo "Version 1.0 | Author: TechChip (Anil Parashar) "
echo ""
tput sgr0
read -p "Please Enter Word Document File name : " file
if [ ! -f $file ]
then
echo "File not exists"
exit 1
fi
if [[ $file == *.docx ]] || [[ $file == *.doc ]]
then
unzip -o $file
if [ ! -f word/footer1.xml ]
then
echo ":::::::::::::::::::::::::::"
echo "This file should be normal"
echo ":::::::::::::::::::::::::::"
exit 1
fi
if grep -q canarytoken word/footer2.xml word/footer1.xml word/footer3.xml word/header1.xml word/header2.xml word/header3.xml;
then
echo ":::::::::::::::::::::::::::"
tput setaf 1
tput bel
echo "[x] canary token detected"
tput sgr0
echo ":::::::::::::::::::::::::::"
else
echo ":::::::::::::::::::::::::::"
tput setaf 2
echo "This file is seem normal"
tput sgr0
echo ":::::::::::::::::::::::::::"
fi
rm -rf word docProps _rels
else
echo "This is not a word document file, select correct file"
fi
