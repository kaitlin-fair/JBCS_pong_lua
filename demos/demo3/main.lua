function love.load()
  X = 0
  Y = 0
end

function love.draw()
  love.graphics.rectangle("fill", X, Y, 50, 80)
end
