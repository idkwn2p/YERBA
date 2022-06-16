require "src/Dependencies"

function love.load()
  
  -- Source of font: https://fonts.google.com/specimen/Press+Start+2P?query=CodeMan38
  -- Author: cody@zone38.net
  font = love.graphics.newFont("fonts/PressStart2P-Regular.ttf")
  love.graphics.setFont(font)
  
  -- Keep track of user input
  love.keyboard.keysPressed = {}
  
  -- Create state machine with game states
  gStateMachine = StateMachine {
    ["menu"] = function() return MenuState() end,
    ["play"] = function() return PlayState() end,
    ["win"] = function() return WinState() end,
    ["inst"] = function() return InstState() end
  }
  
  -- Set state to menu
  gStateMachine:change("menu")
  
  -- Create entities
  gEntities = {
    ["player"] = Player(), 
    ["walls"] = createWalls(), 
    ["enemies"] = createEnemies(),
    ["keysAndFences"] = createKeysAndFences(),
    ["bombilla"] = Bombilla()
  }
  
  end

function love.keypressed(key)
      love.keyboard.keysPressed[key] = true

      if key == "escape" then
          love.event.quit()
      end
  end

function love.keyboard.wasPressed(key)
      return love.keyboard.keysPressed[key]
  end

function love.update(dt)
  gStateMachine:update(dt)
  love.keyboard.keysPressed = {}
end

function love.draw()
  gStateMachine:render()
end
