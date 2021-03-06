

class UI extends Group
  constructor: ->
    super
    core = enchant.Core.instance
    self = @

    #@addChild @life = new LifeLabel 10, 10, 5
    @addChild @score_label = new ScoreLabel 10, 10
    
    @addChild @restart_button = new Sprite 100, 50
    @restart_button.x = core.width - @restart_button.width
    @restart_button.backgroundColor = "green"
    @restart_button.visible = false
    @restart_button.stage = null
    @restart_button.restart = (klass)=>
      
      klass = if klass then klass else @restart_button.stage
      return unless klass
      
      core.replaceScene instance = new klass
      i = 0
      for stage in core.stages
        if stage instanceof klass
          core.stages.splice i, 1 # delete stage
          core.stages.push instance
          return
        
    @restart_button.addEventListener 'touchstart', =>
      @restart_button.restart()
