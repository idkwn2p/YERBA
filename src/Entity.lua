-- Make Entity a class
Entity = Object:extend()

-- Entity properties
function Entity:new(x, y, image, speed)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage(image)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.speed = speed
end