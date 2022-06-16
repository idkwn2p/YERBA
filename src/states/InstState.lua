InstState = BaseState:extend()

function InstState:new()
  InstState.super.new(self)
end

function InstState:update(dt)
  if love.keyboard.wasPressed("m") then
    gStateMachine:change("menu")
  end
end

function InstState:render()
  love.graphics.printf("Instructions", 0, love.graphics.getHeight()/2 - 190, love.graphics.getWidth(), "center")
  love.graphics.print("A MATE is a hot energizing infusion from South America.", 50, love.graphics.getHeight()/2 - 90)
  love.graphics.print("It's made with dried YERBA MATE leaves and hot water,", 50, love.graphics.getHeight()/2 - 70)
  love.graphics.print("much like a tea. It's also drank from a metal straw with", 50, love.graphics.getHeight()/2 - 50)
  love.graphics.print("a filter undearneath called BOMBILLA.", 50, love.graphics.getHeight()/2 - 30)
  love.graphics.print("In this game you'll have to reunite the MATE", 50, love.graphics.getHeight()/2 + 20)
  love.graphics.print("with it's BOMBILLA. Press the W, A, S, D keys to", 50, love.graphics.getHeight()/2 + 40)
  love.graphics.print("move the MATE. Collect the KEYS and avoid the TEACUPS.", 50, love.graphics.getHeight()/2 + 60)
  love.graphics.printf("Press M to go back to the menu", 0, love.graphics.getHeight()/2 + 160, love.graphics.getWidth(), "center")
end