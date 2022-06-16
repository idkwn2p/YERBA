-- Classic, a module to generate classes made by rxi
-- Source: https://github.com/rxi/classic
Object = require "lib/classic"

-- State handeling
-- StateMachine and BaseState from CS50's Introduction to Game Development (https://github.com/games50/fifty-bird), modified to be used with Classic
require "src/StateMachine"
require "src/states/BaseState"
require "src/states/MenuState"
require "src/states/PlayState"
require "src/states/WinState"
require "src/states/InstState"

-- Entities
require "src/Entity"
require "src/entities/Player"
require "src/entities/Wall"
require "src/entities/Enemy"
require "src/entities/Key"
require "src/entities/Fence"
require "src/entities/Bombilla"
