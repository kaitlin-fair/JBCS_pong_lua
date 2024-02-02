function love.load() -- this can hold global constant variables. any values you don't want to change.
  X = 0
  Y = 0
end

function love.draw()
  love.graphics.rectangle("fill", X, Y, 50, 80)
end
