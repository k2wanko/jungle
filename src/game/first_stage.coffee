#= require stage.coffee

class FirstStage extends Stage
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    @backgroundColor = "red"
    console.log "firstStage"

  onPhysicsFrame: -> 
  	console.log "first stage"
      
