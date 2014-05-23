chrome.app.runtime.onLaunched.addListener ->
  width = 1280 / 2
  height = 768 / 2
  chrome.app.window.create "index.html",
    id: "jungle2014511"    
    #"frame": "none"
    minWidth: width
    minHeight: height
    maxWidth: width
    maxHeight: height
    bounds:
      width: width
      height: height

    resizable: false
    singleton: true
  , ->
    console.log "Open window."
    return

  return

