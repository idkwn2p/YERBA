-- Make Entity the superclass of Key
Key = Entity:extend()

function Key:new(x, y)
  
  Key.super.new(self, x, y, "graphics/key.png")
  
  -- State (to determine if fences must be open)
  self.state = "not taken"
  
end

function Key:update(dt, player)
  
  -- If colliding with player, update state from not taken to taken
  if player:checkCollision(self) then
    self.state = "taken"
  end
  
end

function Key:draw()
  
  -- Draw key if it was not taken by the player
  if self.state == "not taken" then 
    love.graphics.draw(self.image, self.x, self.y)
  end
  
end

