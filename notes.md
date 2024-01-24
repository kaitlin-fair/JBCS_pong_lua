# Intro

- Walk through downloading love and running love projects
  - konami code at love website
  - folder with main.lua
  - .love file with a main.lua inside of it
- Lua specifics
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
- Do demo of hello world
  - lua basics
  - functions, variables, local vs. global
- Explain callback functions and how love can use them to do things
- Explain love.load(only called once)
  - Used to setup variables, settings, and load resources
  - saves resources
- love.update
  - Constantly called and is where most math is done. This is where the concept
    of FPS comes into play. We will create a dt, delta time that is cacluated
    from the previous
- love.draw
  - where all the drawing happens, none of the love.graphics.draws will happen
    if not done inside of this functions
  - called continuously
- love.mousepressed, love.mousereleased, love.keypressed, love.keyreleased
  - mouse/key press and release
- The chain: So: love.load -> love.update -> love.draw -> love.update ->
  love.draw -> love.update, etc.
- love.focus - when user clicks off Love window
- love.quit - when user clicks the close button

## Drawing and moving

- DrawMode will indicate whether it is a fill or just a line of the shape
- Lets draw a rectangle!
- Okay how do we move stuff?
  - basic game development concepts, FPS, x and y axis for 2D games
  - Things moving at different speeds because they process faster on different
    computers therefore you need deltatime to be a factor to make things move at
    the same speed.
  - love.update(dt) dt is the amount of time that is passed between each update
  - it will be a smaller factor w/ higher fps and can be multiplied to make an
    even update
- How do we move things ourselves?
  - By Tracking key presses of course!
  - lets do just tracking the right key, can you do all of them?
- Okay we have the basic loop of the love game engine and surpisingly this is
  the basic loop of most game engines
  - We normally always have an update function that it is constantly running and
    does our frame by frame updates
  - we have a draw function that may be called multiple times to render more
    assets
  - and we have a load function that can setup global variables and objects

## More Advanced Lua Concepts

- lets look at some more lua basics now
  - tables and for loops, tables = lists && dicts!(they are multipurpose and a
    bit strange)
  - we can access table elements in two ways obj.x or obj["x"]
  - cool who cares?
  - well because tables can be dicts we can create arbitrary objects out of
    tables, like a circle object
  - tables can also hold functions as sub elements
  - can you make circles appear whenever someone presses a space?
- how can we split development across multiple files? `require("example")`
  - Similarly you can include a file as a library by doing
    `example = require "example"`
- Cool, when can we make games?? Soon! There is another important game
  development concept we must cover first!
  - Object Oriented Programming! Everyone's favorite topic, in this case it is
    actually useful in game-development
  - OOP at a glance, inheritance is extremely useful when we are defining two
    things that are different but share some characteristics. I.e. all objects
    will have an X and Y position, but a player might have an inventory and a
    monster might have items to drop. A wizard would have a mana bar, but a
    warrior wouldn't, things like that.
  - OOP also reduces code reuse for menial task like creating classes and
    objects, which when you make a game you will do ALOT of, being able to
    replicate this easily will reduce workloads and time spent writing code.
    - OOP also hopefully provides us one place to edit something that can impact
      all of our objects reducing the amount of edits and errors we will make
  - In our case we can utilize an external library to mimic the creation of
    objects in Lua and with that will come alot of niceties. I have some
    template code already [classic](https://github.com/rxi/classic)
  - A great separation we have already seen is that circles and rectangles both
    have x and y coordiantes, but rectangles have height and width, whereas
    circles have radiuses
  - Lets make that example
- Some new things
  - Using : allows lua to pass the Object Object that is calling the function to
    the function as the `self` variable this is extremely similar to python's
    self. This can only be used with an instance of that class and static
    methods should still be called with a . and passing the object itself. For
    example when calling a super function
  - What is this super?? Super is a reference to the parent Object the one that
    we extended from so in this case super will call the Shapes new
- Extra OOP notes at all costs we should try our best to reduce how much
  abstraction we are doing. That will only make things more complicated and
  worse so just keep that in mind

## Lets get back to video games

- detecting collisions:
  - This is where the idea of a hitbox will come into play and honestly this is
    a subjective implementation it is all about what you want to define as a
    collision, where should the hitboxes interact. Thankfully this is much
    easier with objects that we have drawn ourselves and are just
    squares/rectangles
- Window resizing??
    - love.resize(w, h)

## Lets Make Pong!

- We can write to the screen to keep track of a score
- We can draw paddles and the ball to the screen and we can control those
  paddles using the keyboard
- That is all of the makings of a simple pong game.

## How about an AI to play against?

## How about a menu to enable multiplayer mode?

## Adding music

## Packaging the game

## Caveats

- We talked very briefly about OOP and that is great, but I am here to tell you
  that it is not perfect!
- OOP is great when we have a small game that is relatively simple, but as soon
  as it becomes bigger OOP begins to hinder the performance. And will most
  definitely lead to scope creep where objects inherit way more than they
  actually need
- What a-lot of developers have switched to instead is Data Oriented Design or
  Entity Component System. Essentially you design components and methods around
  that data that matters and include those components into the entities that
  need them only
- OOP is how a human thinks and DOD is how the computer thinks
