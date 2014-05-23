#= require ui.coffee


class Director

  _Director = class Director

    game = null
    ui = null
    
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
      window.innerWidth

    getHeight: ->
      window.innerHeight

    getUI: ->
      ui = if ui? then ui else new UI

    constructor: ->
      
        
    


  instance = null
    
  @getInstance: ->
    instance = if instance then instance else new _Director
    
