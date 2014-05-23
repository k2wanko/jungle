class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance

    @background = new Sprite 0, 0
    
    @backgroundColor = "green"

    @start_button = new Sprite 0, 0

    @addChild @background

    @addChild @start_button

    @background.backgroundColor = "#55DFFF"

    @background.width = core.width

    @background.height = core.height

    @start_button.backgroundColor = "red"

    @start_button.width = 100

    @start_button.height = 50

    @start_button.addEventListener 'touchend', ->
      first_stage = new FirstStage
      core.stages.push first_stage
      core.replaceScene first_stage

    

    
