

class Background extends Group

  random = (num)->
    Math.floor( Math.random() * (num) )

  random2 = (index, num)->
    Math.random()*(num-index)+index

  @Cloud: class Cloud extends Sprite
    constructor: ->
      core = enchant.Core.instance
      super 80, 80
      @backgroundColor = "#FFFFFF"
      self = @
      
      speed = -> random2 5, 10
      
      y = -> (random2 1, (enchant.Core.instance.height/2)) - self.height
      
      @speed = speed()
      @x = random2 1, core.width
      @y = y()
      s = random2(1, 2)
      @scale s, s
      @onenterframe = =>
        if (@x + @width) < 0
          @x = core.width
          @y= y()
          @speed = speed()
          
        @x -= @speed
        
  @Base: class Base extends Sprite
    constructor: ->
      core = enchant.Core.instance
      super core.width, core.height

      @backgroundColor = "#55DFFF"
      
  constructor: ->
    super

    @backgroundColor = "#55DFFF"

    @addChild @base = new Background.Base
    
    #@addChild @clouds = new Group
    #
    #for i in [0...7]
    #  @clouds.addChild cloud = new Cloud
