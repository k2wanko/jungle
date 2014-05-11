(function() {
  chrome.app.runtime.onLaunched.addListener(function() {
    var height, width;
    width = 640;
    height = 640;
    chrome.app.window.create("index.html", {
      id: "jungle2014511",
      bounds: {
        width: width,
        height: height
      },
      resizable: false,
      singleton: true
    }, function() {
      console.log("Open window.");
    });
  });

}).call(this);
