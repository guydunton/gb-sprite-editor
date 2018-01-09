# Gameboy Sprite Editor

[![Build Status](https://travis-ci.org/gdunton/gb-sprite-editor.svg?branch=master)](https://travis-ci.org/gdunton/gb-sprite-editor)

This project allows someone to edit a sprite for the gameboy which outputs the hex required to put the sprite in a gameboy game.

[Live Demo](https://www.guydunton.com/gb-sprite-editor)

## Warning
This project is currently a work in progress. The planned functionality is:
- [x] Text input for selection
- [x] Color display
- [ ] Color based input
- [ ] Small sprite output
- [ ] Load from hex
- [ ] Display multi sprites

## Build Instructions
This is built with elm 0.18.
1. First checkout the code with git clone ```git clone https://github.com/gdunton/gb-sprite-editor.git```
2. Open directory
3. Run build command ```elm-make src/Main.elm --output=src/elm.js
4. Start elm-reactor 
5. Open http://127.0.0.1:8000/index.html

### e.g.
1. ```git clone https://github.com/gdunton/gb-sprite-editor.git```
2. ```cd gb-sprite-editor```
3. ```elm-make src/Main.elm --output=src/elm.js```
4. ```elm-reactor```
