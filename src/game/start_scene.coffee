class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance
    
    @backgroundColor = "green"

    core.stages.push first_stage = new FirstStage

    core.replaceScene first_stage

    console.log core
    
    