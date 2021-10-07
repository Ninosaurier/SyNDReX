#!/bin/bash

mkdir -p -v /tmp/frontend
cd /tmp/frontend
npx create-react-app .

mv ./* /var/www/frontend
mv .[!.]* /var/www/frontend # Do not forget to copy hidden files!

mkdir -p /var/www/frontend/node_modules/.cache
chmod -R 777 /var/www/frontend/node_modules/.cache