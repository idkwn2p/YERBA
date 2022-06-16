-- Make Entity the superclass of Fence
Fence = Entity:extend()

function Fence:new(x, y, image, key)
  
  Fence.super.new(self, x, y, image)
  
  -- State (to determine if fence is open)
  self.state = "closed"
  
  -- Association with a key
  self.key = key
  
end

function Fence:update(dt, player)
  
  -- Check if key was taken by the player 
  if self.key.state == "taken" then
    self.state = "open"
  else 
    self.state = "closed"
  end
  
  -- Collition of player with fence if it's closed
  if self.state == "closed" then
    player:resolveCollision(self)
  end
  
end

function Fence:draw()
  
  -- Draw fence only if it's closed (key was not taken by the player)
  if self.state == "closed" then 
    love.graphics.draw(self.image, self.x, self.y)
  end
  
end

-- Create keys and associated fences
function createKeysAndFences()
  
  fenceList = {}
  keyList = {}
  
  local dataFence = {
    -- x, y, image and key
    {470, 407, "graphics/lock.png"},
    {530, 1170, "graphics/fence.png"}
  }

  local dataKey = {
    {1360, 85},
    {376, 435}
  }
  
  for i,row in ipairs(dataKey) do
    table.insert(keyList, Key(row[1], row[2]))
  end

  for i,row in ipairs(dataFence) do
    table.insert(fenceList, Fence(row[1], row[2], row[3], keyList[i]))
  end

  return {
    fenceList,
    keyList
  }

end