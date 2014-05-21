#= require stage.coffee

class FirstStage extends Stage
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    core = enchant.Core.instance
    
    @world = new PhysicsWorld @gravityX, @gravityY
    
    @onenterframe = => @world.step core.fps

    console.log "on Stage", core.stages

  onPhysicsFrame: -> 
  	console.log "first stage"
      
