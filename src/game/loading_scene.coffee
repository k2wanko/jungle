
class LoadingScene extends Scene
  constructor: ->
    super

    @addEventListener "progress", @onProgress
    @addEventListener "enterframe", @onEnterframe
    @addEventListener "load", @onLoad

  onProgress: (e)->
    @progress = e.loaded / e.total
    

  onEnterframe: ->

  onLoad: (e)->
    core = enchant.Core.instance
    core.removeScene core.loadingScene
    core.dispatchEvent(e)
    
    
    
