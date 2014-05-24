#= require ui.coffee background.coffee


class Director

  _Director = class Director

    game = null
    ui = null
    background = null
    
    start: ->
      #@getGame().loadingScene = new LoadingScene
      @getGame().onload = => main.call @getGame()
      @getGame().preload resources
      @getGame().start()

    getGame: ->
      
      return game if game?
      
      game = new Game @getWidth(), @getHeight()

      return game

    getWidth: ->
      480

    getHeight: ->
      320

    getUI: ->
      ui = if ui? then ui else new UI

    getBackground: ->
      background = if background? then background else new Background

    constructor: ->
      
        
    


  instance = null
    
  @getInstance: ->
    instance = if instance then instance else new _Director
    
