Ball = Shape:extend()

function Ball:new(x, y, width, height)
  Ball.super.new(self, x, y)
  self.width = width
  self.height = height
  self.speed = 100

  -- Start the ball going in a random direction
  math.randomseed(os.time())
  local rand = math.random(-1, 1)
  while rand == 0 do
    rand = math.random(-1, 1)
  end
  self.x_speed = self.speed * rand
  self.y_speed = self.speed * rand
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:update(dt)
  local window_height = love.graphics.getHeight()
  local window_width = love.graphics.getWidth()

  -- Move the ball
  self.x = self.x + self.x_speed * dt
  self.y = self.y + self.y_speed * dt

  -- Do out of bounds checks
  -- For Y axis it should bounce off and continue
  if self.y < 0 then
    self.y = 0
    self.y_speed = self.y_speed * -1
  elseif (self.y + self.height) > window_height then
    self.y = window_height - self.height
    self.y_speed = self.y_speed * -1
  end

  -- For X axis that means someone scored and so you should mark that, reset the ball, and pause the game
  if self.x < 0 then
    SCORE.p2 = SCORE.p2 + 1
    PLAYING = false
    self:reset()
  elseif (self.x + self.width) > window_width then
    SCORE.p1 = SCORE.p1 + 1
    PLAYING = false
    self:reset()
  end
end

function Ball:checkCollision(paddle)
  local ball_left = self.x
  local ball_right = self.x + self.width
  local ball_top = self.y
  local ball_bottom = self.y + self.height

  local paddle_left = paddle.x
  local paddle_right = paddle.x + paddle.width
  local paddle_top = paddle.y
  local paddle_bottom = paddle.y + paddle.height

  -- if the balls right side is further to the right than the paddles left side
  -- if the balls left side is further to the left than the paddles right side
  -- if the balls bottom side is further down than the paddles top side
  -- if the balls top side is further up than the paddles bottom side
  -- Then it is a collision, else it is not!
  return ball_right > paddle_left
      and ball_left < paddle_right
      and ball_top < paddle_bottom
      and ball_bottom > paddle_top
end

function Ball:reset()
  -- Reset the ball to be in the middle
  local window_height = love.graphics.getHeight()
  local window_width = love.graphics.getWidth()
  self.x = (window_width - self.width) / 2
  self.y = (window_height - self.height) / 2

  -- Make sure the ball returns to the person who just got scored on
  self.x_speed = self.speed * -1
end

function Ball:reverse()
  -- Reverse the ball's direction
  self.x_speed = self.x_speed * -1

  -- Increase speed of the ball each time it is hit
  if self.x_speed < 0 then
    self.x_speed = self.x_speed - 25
  elseif self.x_speed > 0 then
    self.x_speed = self.x_speed + 25
  end

  if self.y_speed < 0 then
    self.y_speed = self.y_speed - 25
  elseif self.y_speed > 0 then
    self.y_speed = self.y_speed + 26
  end
end
