
class Director

  _Director = class Director

    game = null
    
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
      640

    getHeight: ->
      @getWidth()

    constructor: ->
      
        
    


  instance = null
    
  @getInstance: ->
    instance = if instance then instance else new _Director
    
