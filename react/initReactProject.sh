#!/bin/bash

mkdir -p -v /tmp/frontend
cd /tmp/frontend


reactWebPath=$(cat /usr/share/scripts/reactWebPath.txt)

echo "Creating a react project"
npx create-react-app .

mv ./* $reactWebPath
mv .[!.]* $reactWebPath # Do not forget to copy hidden files!

#mkdir -p "${reactWebPath}node_modules/.cache"
#chmod -R 777 "${reactWebPath}node_modules/.cache"