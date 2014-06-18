

class Enemy extends Sprite
  constructor: (x, y, scene, core)->
    super
    Sprite.call(@,32,32)
    @x = x
    @y = y
    @scene = scene
    @core = core
    @frame = 0;
    @image = @core.assets["chara"]
    @scene.addChild @
    
