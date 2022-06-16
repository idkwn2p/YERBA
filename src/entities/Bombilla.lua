Bombilla = Entity:extend()

function Bombilla:new()
  
  Bombilla.super.new(self, 597, 1240, "graphics/bombilla.png")
  
  self.state = "not taken"
  
end

function Bombilla:update(dt, player)
  
  -- Check for collision with player
  if player:checkCollision(self) then
    gStateMachine:change("win")
  end
  
end

function Bombilla:draw()
  if self.state == "not taken" then
    love.graphics.draw(self.image, self.x, self. y)
  end
end