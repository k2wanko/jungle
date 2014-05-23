

class Stage extends Scene
  constructor: (@gravityX, @gravityY = 9.8)->
    super
    
    core = enchant.Core.instance

    self = @

    @scene = new class extends Scene
      constructor: ->
        super
        @world = new PhysicsWorld self.gravityX, self.gravityY
        @shoot_button = new Sprite 100, 100
        @shoot_button.backgroundColor = "black"
        @shoot_button.visible = true
        @shoot_button.x = core.width - @shoot_button.width
        @shoot_button.y = core.height - @shoot_button.height - 20
        @shoot_button.addEventListener 'touchstart', =>
          self.on_shoot()
        @addChild(@shoot_button)
        @onenterframe = =>
          @world.step core.fps
          self.onPhysicsFrame()

    @addChild @scene

    @addChild @ui = Director.getInstance().getUI()

      
  onPhysicsFrame: ->
  on_shoot: ->
    
