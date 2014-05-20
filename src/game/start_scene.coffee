class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance

    @background = new Sprite 0, 0
    
    @addChild @background

    @background.backgroundColor = "blue"

    @background.width = core.width

    @background.height = core.height

    core.stages.push new Stage

    console.log core
    
