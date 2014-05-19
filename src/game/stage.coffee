

class Stage extends Scene
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    core = enchant.Core.instance
    
    @world = new PhysicsWorld @gravityX, @gravityY
    
    @onenterframe = => 
      @world.step core.fps
      @onPhysicsFrame()


    console.log "on Stage", core.stages
      
  onPhysicsFrame: ->
    
