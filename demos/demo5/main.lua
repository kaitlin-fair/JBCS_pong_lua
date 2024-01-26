function love.load()
  X = 0
  Y = 0
end

function love.draw()
  love.graphics.rectangle("fill", X, Y, 50, 80)
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    X = X + 100 * dt
  end
end

--function love.update(dt)
--  if love.keyboard.isDown("right") then
--    X = X + 100 * dt
--  elseif love.keyboard.isDown("left") then
--    X = X - 100 * dt
--  elseif love.keyboard.isDown("up") then
--    Y = Y - 100 * dt
--  elseif love.keyboard.isDown("down") then
--    Y = Y + 100 * dt
--  end
--end
