

class UI extends Group
  constructor: ->
    super
    core = enchant.Core.instance

    @addChild @life = new Sprite 300, 0
    @life.width = @life.height = 100
    @life.backgroundColor = "green"

    
    @addChild @restart_button = new Sprite 100, 50
    @restart_button.x = core.width - @restart_button.width
    @restart_button.backgroundColor = "green"
    @restart_button.visible = false