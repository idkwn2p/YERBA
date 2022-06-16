-- Make Wall a class
Wall = Object:extend()

-- Wall properties
function Wall:new(x, y, width, height)
  
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  
end

-- Render individual wall
function Wall:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- Creates an object for each wall
function createWalls()
  
  wallList = {}
  
  -- Data for walls
  local data = {
    -- First room
    {417, 1070, 100, 300},
    {968, 1070, 100, 300},
    {420, 1359, 600, 100},
    -- First corridor
    {497, 819, 200, 270},
    {788, 819, 200, 270}, 
    -- Second room
    {916, 634, 84, 50},
    -- Middle piece
    {653, 228, 392, 366},
    {473, 498, 180, 90},
    {209, 585, 791, 55},
    -- Right corridor
    {917, 774, 300, 100},
    {1180, 590, 50, 200},
    -- Right room
    {1136, 414, 300, 180},
    {1000, -46, 445, 100},
    {1406, 0, 100, 500},
    -- Loop
    {209, 228, 90, 411},
    {473, 228, 89, 180},
    {209, 228, 353, 90},
    -- Top
    {100, -17, 945, 155},
    -- Left
    {68, 40, 50, 700},
    {68, 730, 494, 100}
  }
  
  
  for i,row in ipairs(data) do
    table.insert(wallList, Wall(row[1], row[2], row[3], row[4]))
  end
  
  return wallList
  
end