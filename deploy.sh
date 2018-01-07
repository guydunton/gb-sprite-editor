cp index.html build/index.html
mkdir build/styles
cp styles/style.css build/styles/style.css
sed -i 's/<!-- base placeholder -->/<base href=\"www.guydunton.com\/gb-sprite-editor\"\/>/g' build/index.html