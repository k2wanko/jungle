class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance

    @background = new Sprite 0, 0
    
    @backgroundColor = "green"

    @addChild @background

    @background.backgroundColor = "blue"

    @background.width = core.width

    @background.height = core.height

    core.stages.push first_stage = new FirstStage

    core.replaceScene first_stage