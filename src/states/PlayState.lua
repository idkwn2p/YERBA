PlayState = BaseState:extend()

function PlayState:new()
  
  -- Inherit 
  PlayState.super.new(self)
  
end

function PlayState:update(dt)
  
  -- Update player
  gEntities.player:update(dt)
  
  -- Update enemies and check for damage
  for i,v in ipairs(gEntities.enemies) do
    v:update(dt)
    gEntities.player:checkDamage(v)
  end
  
  -- Resolve collision with walls
  for i,v in ipairs(gEntities.walls) do
    gEntities.player:resolveCollision(v)
  end
  
  -- Update fences
  for i,v in ipairs(gEntities.keysAndFences[1]) do
    v:update(dt, gEntities.player)
  end
  
 -- Update keys
  for i,v in ipairs(gEntities.keysAndFences[2]) do
    v:update(dt, gEntities.player)
  end
  
  -- Update bombilla
  gEntities.bombilla:update(dt, gEntities.player)
 
end

function PlayState:render()
  
  -- Create camera
    love.graphics.translate(-gEntities.player.x + 395, -gEntities.player.y + 290)
    
  -- Draw map
  drawMap()
  
  -- Draw player
  gEntities.player:draw()
  
  -- Draw enemies
  for i,v in ipairs(gEntities.enemies) do
    v:draw()
  end
  
  -- Draw fences
  for i,v in ipairs(gEntities.keysAndFences[1]) do
    v:draw()
  end
  
  -- Draw keys
  for i,v in ipairs(gEntities.keysAndFences[2]) do 
    v:draw()
  end
  
  gEntities.bombilla:draw()
  
end

-- Draws map of game
local map = love.graphics.newImage("graphics/tilemap.png")

function drawMap()
  love.graphics.draw(map, 0, 0, 0, 1.5, 1.5)
end