local p1
local p2
local ball
PLAYING = false
SCORE = {}

function love.load()
  Object = require("classic")
  require("shape")
  require("paddle")
  require("ball")

  -- Setup up the paddles and their locations, make paddle lengths dependent up window height
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  local paddle_width = 20
  local paddle_height = window_height / 6
  local paddle_x_offset = 100
  p1 = Paddle(paddle_x_offset, (window_height - paddle_height) / 2, paddle_width, paddle_height, "w", "s")
  p2 = Paddle(window_width - paddle_x_offset, (window_height - 100) / 2, paddle_width, paddle_height, "up", "down")

  -- Setup the ball and make it dependent upon paddle height
  local ball_width = paddle_height / 4
  local ball_height = ball_width
  ball = Ball((window_width - ball_width) / 2, (window_height - ball_height) / 2, ball_width, ball_height)

  -- Setup player scores
  SCORE.p1 = 0
  SCORE.p2 = 0
end

function love.draw()
  p1:draw()
  p2:draw()
  ball:draw()

  if not PLAYING then
    -- Output message saying press space to begin play
    local play_message = "Press space to begin playing"
    local font = love.graphics.getFont()
    love.graphics.print(
      play_message,
      love.graphics.getWidth() / 2,
      50,
      0,
      2,
      2,
      font:getWidth(play_message) / 2,
      font:getHeight() / 2
    )
  else
    -- Draw the midline if playing
    local x = love.graphics.getWidth() / 2
    local y = 0
    local line_len = love.graphics.getHeight() / 20
    for i = 1, 20 do
      love.graphics.line({ x, y, x, y + line_len })
      y = y + line_len * 2
    end
  end
end

function love.update(dt)
  -- Only move objects if we are playing
  if PLAYING then
    p1:update(dt)
    p2:update(dt)
    ball:update(dt)
    -- Check for a collision and reset if necessary
    print("paddle1")
    if ball:checkCollision(p1) then
      ball:reverse()
    elseif ball:checkCollision(p2) then
      ball:reverse()
    end
  end
end

function love.keypressed(key)
  -- Check for space being pressed so that we can begin the game
  if key == "space" then
    PLAYING = true
  end
end
