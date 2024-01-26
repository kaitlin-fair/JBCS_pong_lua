Paddle = Shape:extend()

function Paddle:new(x, y, width, height, up_key, down_key)
  Paddle.super.new(self, x, y)
  self.width = width
  self.height = height
  self.up_key = up_key
  self.down_key = down_key
  self.speed = 200
end

function Paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
  local window_height = love.graphics.getHeight()
  -- Move the paddle in the direction the player wants
  if love.keyboard.isDown(self.up_key) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown(self.down_key) then
    self.y = self.y + self.speed * dt
  end

  -- Do out of bounds checks
  if self.y < 0 then
    self.y = 0
  elseif (self.y + self.height) > window_height then
    self.y = window_height - self.height
  end
end

