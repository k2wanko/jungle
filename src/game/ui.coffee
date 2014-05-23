

class UI extends Group
  constructor: ->
    super

    @addChild @life = new Sprite 300, 0
    @life.width = @life.height = 100
    @life.backgroundColor = "green"
