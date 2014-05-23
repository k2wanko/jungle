

class Stage extends Scene
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    core = enchant.Core.instance

    self = @

    @scene = new class extends Scene
      constructor: ->
        super
        @world = new PhysicsWorld self.gravityX, self.gravityY

        @onenterframe = =>
          @world.step core.fps
          self.onPhysicsFrame()

    @addChild @scene

    @addChild @ui = Director.getInstance().getUI()
      
  onPhysicsFrame: ->
    
