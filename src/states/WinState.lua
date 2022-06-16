WinState = PlayState:extend()

-- Animation
local frames = {
  love.graphics.newImage("graphics/endleft.png"),
  love.graphics.newImage("graphics/endright.png")
}

local currentFrame = 1

function WinState:new()
  
  WinState.super.new(self)
  
end

function WinState:update(dt)
  
  if love.keyboard.wasPressed("space") then
    -- Prepare for PlayState
    for i,v in ipairs(gEntities.keysAndFences[1]) do
      v.state = "closed"
    end
    for i,v in ipairs(gEntities.keysAndFences[2]) do
      v.state = "not taken"
    end
    gEntities.player.x = 820
    gEntities.player.y = 1200
    gStateMachine:change("play")
  elseif love.keyboard.wasPressed("m") then
    -- Prepare for MenuState
    for i,v in ipairs(gEntities.keysAndFences[1]) do
      v.state = "closed"
    end
    for i,v in ipairs(gEntities.keysAndFences[2]) do
      v.state = "not taken"
    end
    gEntities.player.x = 820
    gEntities.player.y = 1200
    gStateMachine:change("menu")
  end
  
  
  -- Animation loop
  currentFrame = currentFrame + 5 * dt
  if currentFrame >= 3 then
    currentFrame = 1
  end
  
end

function WinState:render()
  
  -- Create camera
    love.graphics.translate(-gEntities.player.x + 395, -gEntities.player.y + 290)
  
  -- Messages
  love.graphics.printf("YOU WIN!", gEntities.player.x - 230, gEntities.player.y - 30, 500, "center")
  love.graphics.printf("Press the SPACEBAR to play again", gEntities.player.x - 230, gEntities.player.y + 70 , 500, "center")
  love.graphics.printf("Press M to go back to the menu", gEntities.player.x - 230, gEntities.player.y + 120 , 500, "center")
  
  -- Print current animation frame
  love.graphics.draw(frames[math.floor(currentFrame)], gEntities.player.x, gEntities.player.y, 0, 1.1, 1.1)
  
  
end