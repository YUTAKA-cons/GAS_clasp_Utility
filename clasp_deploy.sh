#!/bin/sh

# 2回目以降デプロイIDが更新されないようにするためのシェル。
# 1回目だけは、 clasp deploy を使用してデプロイする。

# build
# npm run build

# push
sh clasp_push.sh "$1"

# Direstry Action
if [ $1 ]; then
    cd "$1"
fi

# copy setting file
cp appsscript.json ./src
cp .clasp.json ./src

# get last deployment id
LAST_DEPLOYMENT_ID=$( clasp deployments | pcregrep -o1 '\- ([A-Za-z0-9\-\_]+) @\d+ - web app meta-version' )
if [ -z "$LAST_DEPLOYMENT_ID" ]; then
    LAST_DEPLOYMENT_ID=$( clasp deployments | tail -1 | pcregrep -o1 '\- ([A-Za-z0-9\-\_]+)' ) 
fi

# deploy
if [ $? -eq 0 ]; then
    clasp deploy --deploymentId $LAST_DEPLOYMENT_ID
fi

# delete setting file
rm ./src/appsscript.json
rm ./src/.clasp.json

# return
if [ $1 ]; then
    cd ../
fi
