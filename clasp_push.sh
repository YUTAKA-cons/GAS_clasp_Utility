#!/bin/sh

# Direstry Action
if [ $1 ]; then
    cd "$1"
fi

# copy setting file
cp appsscript.json ./src
cp .clasp.json ./src

# push
clasp -P ./src push

# delete setting file
rm ./src/appsscript.json
rm ./src/.clasp.json

# return
if [ $1 ]; then
    cd ../
fi