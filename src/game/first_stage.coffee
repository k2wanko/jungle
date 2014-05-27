#= require stage.coffee

class FirstStage extends Stage
  constructor: (@gravityX, @gravityY = 9.8)->
    super

    @ui.restart_button.stage = FirstStage

    @touchcount = 0
    @main_past_x = 0
    @main_past_y = 0
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
    #メインキャラクター
    @main_char = new enchant.box2d.PhyBoxSprite(32,32,enchant.box2d.DYNAMIC_SPRITE,0.8,0.3,0.2,true)
    @main_char.image = core.assets['chara']
    @main_char.frame = 0
    @main_char.position =
      x : 40
      y : 40
    @main_past_x = 100
    @main_past_y = 200

    #敵キャラ１
    @enemy_charA = new enchant.box2d.PhyBoxSprite(32,32,enchant.box2d.STATIC_SPRITE,0.8,0.3,0.2,true)
    @enemy_charA.image = core.assets['chara']
    @enemy_charA.frame = 8
    @enemy_charA.position = 
      x : 300
      y : 150
    @enemy_charA.body.m_isSensor = true
    #敵キャラ２
    @enemy_charB = new enchant.box2d.PhyBoxSprite(32,32,enchant.box2d.STATIC_SPRITE,0.8,0.3,0.2,true)
    @enemy_charB.image = core.assets['chara']
    @enemy_charB.frame = 10
    @enemy_charB.position = 
      x : core.width * 3 / 4
      y : core.height * 3 / 4
    @enemy_charB.body.m_isSensor = true
     
    #画像の描写
    @scene.addChild(@floor_a)
    @scene.addChild(@floor_b)
    @scene.addChild(@main_char)
    @scene.addChild(@enemy_charA)
    @scene.addChild(@enemy_charB)

    
    load = 5
    #画面をタッチされた時の反応
    @on "touchstart", (e) =>
      if @touchcount == 0 
        console.log("sceneX : " + @scene.x)
        @floor_a.contact (sprite)=>
            if sprite == @main_char
              sprite.applyImpulse new b2Vec2((e.x - sprite.x) / load, (sprite.y - e.y) / load) 
              @touchcount++
              @ui.restart_button.visible = true
    
  #フレームごとの処理
  onPhysicsFrame: ->
  	if @main_char.x >= 100
      @scene.x -= (@main_char.x - @main_past_x)
      @main_past_x = @main_char.x
    if @main_char.y <= 200
      @scene.y -= (@main_char.y - @main_past_y)
      @main_past_y = @main_char.y
    if @scene.x * (-1) >= @floor_a.position.x + @width / 2
      @floor_a.x = @floor_b.position.x + @width / 2
    if @scene.x * (-1) >= @floor_b.position.x + @width / 2
      @floor_b.x = @floor_a.position.x + @width / 2
    @main_char.contact (sprite)=>
      if sprite != @floor_a and sprite != @floor_b
        sprite.destroy()
  
