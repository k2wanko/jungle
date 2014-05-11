(function() {
  var Director, LoadingScene, StartScene, main, resources,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Director = (function() {
    var instance, _Director;

    function Director() {}

    _Director = Director = (function() {
      var game;

      game = null;

      Director.prototype.start = function() {
        this.getGame().onload = (function(_this) {
          return function() {
            return main.call(_this.getGame());
          };
        })(this);
        this.getGame().preload(resources);
        return this.getGame().start();
      };

      Director.prototype.getGame = function() {
        if (game != null) {
          return game;
        }
        game = new Game(this.getWidth(), this.getHeight());
        return game;
      };

      Director.prototype.getWidth = function() {
        return 640;
      };

      Director.prototype.getHeight = function() {
        return this.getWidth();
      };

      function Director() {}

      return Director;

    })();

    instance = null;

    Director.getInstance = function() {
      return instance = instance ? instance : new _Director;
    };

    return Director;

  })();

  LoadingScene = (function(_super) {
    __extends(LoadingScene, _super);

    function LoadingScene() {
      LoadingScene.__super__.constructor.apply(this, arguments);
      this.addEventListener("progress", this.onProgress);
      this.addEventListener("enterframe", this.onEnterframe);
      this.addEventListener("load", this.onLoad);
    }

    LoadingScene.prototype.onProgress = function(e) {
      return this.progress = e.loaded / e.total;
    };

    LoadingScene.prototype.onEnterframe = function() {};

    LoadingScene.prototype.onLoad = function(e) {
      var core;
      core = enchant.Core.instance;
      core.removeScene(core.loadingScene);
      return core.dispatchEvent(e);
    };

    return LoadingScene;

  })(Scene);

  main = function() {
    return this.pushScene(new StartScene);
  };

  resources = (function() {
    var k, path, res, v;
    path = "/images/";
    res = {
      chara: "chara5.png"
    };
    for (k in res) {
      v = res[k];
      res[k] = path + v;
    }
    return res;
  })();

  StartScene = (function(_super) {
    __extends(StartScene, _super);

    function StartScene() {
      StartScene.__super__.constructor.apply(this, arguments);
      this.backgroundColor = "green";
    }

    return StartScene;

  })(Scene);

  window.onload = function() {
    Director.getInstance().start();
  };

}).call(this);
