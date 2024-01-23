function love.load()
  Object = require("classic")
  require("shape")
  require("rectangle")
  require("circle")

  r = Rectangle(100, 100, 200, 50)
  c = Circle(350, 80, 40)
end

function love.draw()
  r:draw()
  c:draw()
end

function love.update(dt)
  r:update(dt)
  c:update(dt)
end
