-- Make Entity the superclass of Enemy
Enemy = Entity:extend()

function Enemy:new(x, y, start, finish, path)
  
  Enemy.super.new(self, x, y, "graphics/mate.png", 300)
  
  -- Enemy's path
  self.start = start
  self.finish = finish
  self.path = path
  
  -- Animation
  self.frames = {
    love.graphics.newImage("graphics/tder.png"),
    love.graphics.newImage("graphics/tizq.png")
  }
  self.currentFrame = 1
  
end

function Enemy:update(dt)
  
  -- Loop through animation
  self.currentFrame = self.currentFrame + 5 * dt
  if self.currentFrame >= 3 then
    self.currentFrame = 1
  end
  
  -- Enemy moves horizontally
  if self.path == "hor" then
    
    self.x = self.x + self.speed * dt 
    
    if self.x < self.start then
      self.x = self.start
      self.speed = -self.speed
    elseif self.x + self.width > self.finish then
      self.x = self.finish - self.width 
      self.speed = -self.speed
    end
    
  -- Enemy moves vertically
  elseif self.path == "ver" then
    
    self.y = self.y + self.speed * dt
    
    if self.y < self.start then
      self.y = self.start
      self.speed = -self.speed
    elseif self.y + self.height > self.finish then
      self.y = self.finish - self.height
      self.speed = -self.speed
    end
    
  end
  
end

function Enemy:draw()
  
  love.graphics.draw(self.frames[math.floor(self.currentFrame)], self.x, self.y, 0, 1.4, 1.4)
  
end

function createEnemies()
  
  enemyList = {}
  
  local data = {
    {120, 165, 120, 1000, "hor"}, 
    {1200, 100, 50, 405, "ver"},
    {1300, 405, 50, 405, "ver"}, 
    {560, 710, 560, 1160, "hor"}
  }

  for i,row in ipairs(data) do
    table.insert(enemyList, Enemy(row[1], row[2], row[3], row[4], row[5]))
  end
  
  return enemyList
  
end