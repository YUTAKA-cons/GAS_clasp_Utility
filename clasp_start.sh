#!/usr/sh

# $1 Puroject Name
# $2 clasp type

dirName="$1"
claspType=$2
pjtName=${dirName#*-}

echo --------------------------------
echo ${dirName} Project start
echo

# create directory
cp -a gas-base ${pjtName}
cd ./${pjtName}
echo \> Completed copy base files

# clasp start
clasp create --rootDir ./src
cd ../
mv ${pjtName} ${dirName}
cd ./${dirName}
echo \> Completed clasp settings

# change time zone
sed -i .bak "s/America\/New_York/Asia\/Tokyo/g" appsscript.json
rm appsscript.json.bak

echo 
echo Compleated !
echo --------------------------------