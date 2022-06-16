MenuState = BaseState:extend()

function MenuState:new()
  MenuState.super.new(self)
end

function MenuState:update(dt)
  if love.keyboard.wasPressed("space") then
    gStateMachine:change("play")
  elseif love.keyboard.wasPressed("i") then
    gStateMachine:change("inst")
  end
end

function MenuState:render()
  love.graphics.printf("YERBA", 0, love.graphics.getHeight()/2 - 80, love.graphics.getWidth(), "center")
  love.graphics.printf("Press I to see instructions", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
  love.graphics.printf("Press the SPACEBAR to play", 0, love.graphics.getHeight()/2 + 40, love.graphics.getWidth(), "center")
end