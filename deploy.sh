#!/bin/sh
cp index.html build/index.html
mkdir build/styles
cp styles/style.css build/styles/style.css
cd build
sed -i 's/<!-- base placeholder -->/<base href=\"https://www.guydunton.com\/gb-sprite-editor\/\"\/>/g' index.html
cd ..