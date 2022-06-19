# YERBA
My first game, created with Lua using LÖVE2D as a Final Project for CS50's Introduction to Computer Science.

## Introduction

YERBA is a small scale 2D chase game. It is controlled via keyboard input. 

## Documents

### main.lua
Here the three main functions of love are executed: `love.load()`, `love.update()` and `love.draw()`.

In `love.load()` the text font is set. The State Machine and all the different Game States are created too, as well as the different Entities. A global table is also created to keep track of the user's keyboard input.

In `love.update()` and `love.draw()` the update and love functions of the current State are executed.

### conf.lua
It sets the name and icon of the game window.

### src/
It contains the `Dependencies.lua`, `Entity.lua` and `StateMachine.lua` file with the `entities/` and `states/` subdirectories.

`Dependencies.lua` "imports" all the libraries and modules used.

`Entity.lua` contains the Entity class. All the others entities of the game will inherit the properties of Entity.

`StateMachine.lua` contains the StateMachine module that handles transitions between Game States.

Inside `entities/` are six classes, and Entity is the superclass of all of them. Each class serves as the blueprint of a type of entity that the player -also an entity- can interact with. The objects made with the Enemy class send the player back to the beginning of the game upon collision. The Key class creates keys which the player can collect by colliding with them. The Fence class creates fences which are "opened" once the corresponding key is collected by the player. The Wall class creates invisible walls to set the boundaries of the map. The Bombilla class creates the bombilla that the player has to collide with to win the game.

Inside `states/` are five modules, one for each State of the game. In the Play State all of the entities are updated and rendered. The user will only alternate between the Play State and Win State by colliding with the bombilla, and outside the Play State it's possible to change of state with the keyboard.

### lib/
The subdirectory `lib/` has all of the external libraries used. This game uses **Classic**, a class module for Lua created by rxi. Source of the code: https://github.com/rxi/classic

### graphics/
The subdirectory `graphics/` has all the graphics and artwork, both created by me. They were made with [Pixel Station](https://play.google.com/store/apps/details?id=com.studios.pixelstation).

### fonts/
The subdirectory `fonts/` has all the text fonts of the game with the corresponding license. Source of the font: https://fonts.google.com/specimen/Press+Start+2P#standard-styles

## Credits

The game state management is based on the content of **CS50's Introduction to Game Development** from weeks 0 to 1: https://cs50.harvard.edu/games/2018/. The content of the course is licensed under a Creative Commons [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/) license. Said code was modified to fit the **Classic** module. 

**Classic** is a tiny class module for Lua. Source of the code: https://github.com/rxi/classic. It is licensed under the [MIT License](https://github.com/rxi/classic/blob/master/LICENSE).

Source of the text font used for the game: https://fonts.google.com/specimen/Press+Start+2P. Its is licensed under the [Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).
