class StartScene extends Scene
  constructor: ->
    super

    core = enchant.Core.instance

    @addChild @background = Director.getInstance().getBackground()

    @addChild @start_button = new Sprite 236, 48

    @start_button.image = core.assets['start_button']

    @start_button.x = (core.width/2) - (@start_button.width/2)
    @start_button.y = (core.height/2) - (@start_button.height/2)

    @start_button.addEventListener 'touchend', ->
      first_stage = new FirstStage
      core.stages.push first_stage
      core.replaceScene first_stage
