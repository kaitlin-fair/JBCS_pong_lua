# Intro

* Walk through downloading love and running love projects
    * konami code at love website
    * folder with main.lua
    * .love file with a main.lua inside of it
* Lua specifics
    ```lua
    -- comment
    -- functions
    function example()
        print("Hello, World!")
    end
    -- variables
    a = 5
    name = "christian"
    ```
* Do demo of hello world
* Explain callback functions and how love can use them to do things
* Explain love.load(only called once)
    * Used to setup variables, settings, and load resources
    * saves resources
* love.update
    * Constantly called and is where most math is done. This is where the
    concept of FPS comes into play. We will create a dt, delta time that
    is cacluated from the previous
* love.draw
    * where all the drawing happens, none of the love.graphics.draws will happens
    if not done inside of this functions
    * called continuously
* love.mousepressed, love.mousereleased, love.keypressed, love.keyreleased
    * mouse/key press and release
* The chain: So: love.load -> love.update -> love.draw -> love.update -> love.draw -> love.update, etc.
* love.focus - when user clicks off Love window
* love.quit - when user clicks the close button
* DrawMode will indicate whether it is a fill or just a line of the shape
* Lets draw a rectangle!
* Okay how do we move stuff?
    * basic game development concepts, FPS, x and y axis for 2D games
    * Things moving at different speeds because they process faster on different
     computers therefore you need deltatime to be a factor to make things move
    at the same speed.
    * love.update(dt) dt is the amount of time that is passed between each update
    * it will be a smaller factor w/ higher fps and can be multiplied to make an
    even update
