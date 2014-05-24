chrome.app.runtime.onLaunched.addListener ->
  width = Math.ceil(960 / 2)
  height = Math.ceil(640 / 2)
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

