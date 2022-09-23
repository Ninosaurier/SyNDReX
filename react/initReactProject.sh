#!/bin/bash

mkdir -p -v /tmp/frontend
cd /tmp/frontend


echo "Creating a react project"
npx create-react-app .

mv ./* /var/www/frontend/
mv .[!.]* /var/www/frontend/ # Do not forget to copy hidden files!

cd /var/www/frontend

mkdir -p "/var/www/frontend/node_modules/.cache" # npm is not able to create the folder. Only root can do it
chmod -R 777 "/var/www/frontend/node_modules/.cache"

npm install
