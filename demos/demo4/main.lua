function love.load()
  X = 0
  Y = 0
end

function love.draw()
  love.graphics.rectangle("fill", X, Y, 50, 80)
end

function love.update()
  X = X + 5
end

-- This is super slow though so we can update to 100, but the gist is it will move 100 pixels per second
--function love.update(dt)
--  X = X + 5 * dt
--end
