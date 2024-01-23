function love.load()
  CIRCLE = {}
  CIRCLE.x = 50
  CIRCLE.y = 50
  CIRCLE.radius = 50
end

function love.draw()
  love.graphics.circle("line", CIRCLE.x, CIRCLE.y, CIRCLE.radius)
end

-- function love.load()
--   LIST_OF_CIRCLES = {}
-- end
-- 
-- function createCircle()
--   local circle = {}
--   circle.x = 50
--   circle.y = 50
--   circle.radius = 50
--   circle.speed = 50
--   table.insert(LIST_OF_CIRCLES, circle)
-- end
-- 
-- function love.keypressed(key)
--   if key == "space" then
--     createCircle()
--   end
-- end
-- 
-- function love.draw()
--   for i, v in ipairs(LIST_OF_CIRCLES) do
--     love.graphics.circle("line", v.x, v.y, v.radius)
--   end
-- end
-- 
-- function love.update(dt)
--   for i, v in ipairs(LIST_OF_CIRCLES) do
--     v.x = v.x + v.speed * dt
--   end
-- end
