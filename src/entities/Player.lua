-- Make Entity the superclass of Player
Player = Entity:extend()

-- Player properties
function Player:new()
  
  Player.super.new(self, 820, 1200, "graphics/mate.png", 300)
  
  -- Keep track of last position
  self.last = {}
  self.last.x = self.x
  self.last.y = self.y
  
  -- Animation
  self.frames = {
    love.graphics.newImage("graphics/der.png"),
    love.graphics.newImage("graphics/izq.png")
  }
  
  self.currentFrame = 1
  
end

-- Update Player
function Player:update(dt)
  
  -- Register last position
  self.last.x = self.x
  self.last.y = self.y
  
  -- Animation 
  self.currentFrame = self.currentFrame + 5 * dt
  if self.currentFrame >= 3 then
    self.currentFrame = 1
  end
  
  -- Control
  if love.keyboard.isDown("d") then
    self.x = self.x + self.speed * dt
  end
  
  if love.keyboard.isDown("a") then
    self.x = self.x - self.speed * dt
  end
  
  if love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt
  end
  
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt
  end
  
  
  
end

-- Draw Player
function Player:draw()
  
  -- Controls
  if love.keyboard.isDown("a") or 
  love.keyboard.isDown("s") or
  love.keyboard.isDown("d") or 
  love.keyboard.isDown("w") then
    
    -- Moving animation
    love.graphics.draw(self.frames[math.floor(self.currentFrame)], self.x, self.y, 0, 1.1, 1.1)
  else
    
    -- Static
    love.graphics.draw(self.image, self.x, self.y, 0, 1.1, 1.1)
  end
  
end

-- Check if there's a collision
function Player:checkCollision(e)
    return self.x + self.width > e.x
    and self.x < e.x + e.width
    and self.y + self.height > e.y
    and self.y < e.y + e.height
end

-- Move Player if there's a collision
function Player:resolveCollision(e)
  if self:checkCollision(e) then
    self.x = self.last.x
    self.y = self.last.y
  end
end

-- If touching enemy, restart
function Player:checkDamage(e)
  
  if self:checkCollision(e) then
    -- Go back to the start
    self.x = 820
    self.y = 1200
    
    -- Return keys and fences
    for i,v in ipairs(gEntities.keysAndFences[2]) do
      v.state = "not taken"
    end
    
  end
end