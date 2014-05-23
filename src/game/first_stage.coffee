#= require stage.coffee

class FirstStage extends Stage
  constructor: (@gravityX, @gravityY = 9.8)->
    super

    @ui.restart_button.stage = FirstStage

    @touchcount = 0
    @main_past_x = 0
    @param_y = 0
    
    console.log "firstStage"
    core = enchant.Core.instance

    #床の一つ目
    @floor_a = new enchant.box2d.PhyBoxSprite(@width, 20, enchant.box2d.STATIC_SPRITE, 1.5,0.3,0.0,true)
    @floor_a.backgroundColor = "#FF0"
    @floor_a.position = 
      x : @width - @width / 2
      y : @height - 20 / 2
    #床の２つ目
    @floor_b = new enchant.box2d.PhyBoxSprite(@width, 20, enchant.box2d.STATIC_SPRITE, 1.5,0.3,0.0,true)
    @floor_b.backgroundColor = "#F2F"
    @floor_b.position = 
      x : @width * 2 - @width / 2
      y : @height - 20 / 2
    #飛ぶ強さを決めるパラメーターの軸の部分  
    @parameter_base_sprite = new Sprite(10,100)
    @parameter_base_surface = new Surface(10,100)
    @parameter_base_surface.context.fillStyle = "red"
    @parameter_base_surface.context.fillRect 0, 0, 10, 100
    @parameter_base_sprite.x = 20
    @parameter_base_sprite.y = 10
    @parameter_base_sprite.image = @parameter_base_surface
    
    #飛ぶ強さを決めるパラメーターの動く部分
    @parameter_move_sprite = new Sprite(30,5)
    @parameter_move_surface = new Surface(30, 5)
    @parameter_move_surface.context.fillStyle = "yellow"
    @parameter_move_surface.context.fillRect 0, 0, 30, 5
    @parameter_move_sprite.x = 10
    @parameter_move_sprite.y = 11
    @parameter_move_sprite.image = @parameter_move_surface


    # main_char = new enchant.box2d.PhyCircleSprite(16,enchant.box2d.DYNAMIC_SPRITE,0.8,100.5,0.2,true)
    # main_char.image = core.assets['chara']
    # main_char.frame = 0
    # main_char.position =
    #   x : 40
    #   y : 40
    #メインキャラの生成
    @main_char = new enchant.box2d.PhyBoxSprite(32,32,enchant.box2d.DYNAMIC_SPRITE,0.8,0.3,0.2,true)
    @main_char.image = core.assets['chara']
    @main_char.frame = 0
    @main_char.position =
      x : 40
      y : 40
    @main_past_x = 100
    
    #画像の描写
    @scene.addChild(@floor_a)
    @scene.addChild(@floor_b)
    @scene.addChild(@main_char)
    @scene.addChild(@parameter_base_sprite)
    @scene.addChild(@parameter_move_sprite)
    console.log(@scene.x)

    #画面をタッチされた時の反応
    @on "touchstart", (e) =>
      if @touchcount == 0
        @main_char.applyImpulse new b2Vec2(20, 30)
        @touchcount++
        @ui.restart_button.visible = true
    # @onPhysicsFrame = ->
    #   if main_char.x >= 100
    #     @scene.x -= (main_char.x - main_past_x)
    #     main_past_x = main_char.x
    #   if parameter_move_sprite.y >= 100
    #     param_y = -1
    #   else if parameter_move_sprite.y <= 12
    #     param_y = 1
    #   parameter_move_sprite.y += param_y
    #   return 0
    
  #フレームごとの処理
  onPhysicsFrame: ->
  	if @main_char.x >= 100
      @scene.x -= (@main_char.x - @main_past_x)
      @main_past_x = @main_char.x
    if @parameter_move_sprite.y >= 100
      @param_y = -1
    else if @parameter_move_sprite.y <= 12
      @param_y = 1
    @parameter_move_sprite.y += @param_y
    return 0
  
  
