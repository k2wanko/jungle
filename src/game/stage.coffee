

class Stage extends Scene
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    core = enchant.Core.instance

    self = @

    @addChild @background = Director.getInstance().getBackground()

    @backgroundColor = @background.backgroundColor

    @scene = new class extends Scene
      constructor: ->
        super
        
        @world = new PhysicsWorld self.gravityX, self.gravityY

        @onenterframe = =>
          @world.step core.fps
          self.onPhysicsFrame()
          self.background.base.x = @x
          self.background.clouds.y = @y
          

    @addChild @scene

    @addChild @ui = Director.getInstance().getUI()
      
  onPhysicsFrame: ->
    
