chrome.app.runtime.onLaunched.addListener ->
  width = 640
  height = 640
  chrome.app.window.create "index.html",
    id: "jungle2014511"    
    #"frame": "none",
    bounds:
      width: width
      height: height

    resizable: false
    singleton: true
  , ->
    console.log "Open window."
    return

  return

