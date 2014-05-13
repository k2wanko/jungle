class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance
    
    @backgroundColor = "green"

    core.stages.push new Stage

    console.log core
    
