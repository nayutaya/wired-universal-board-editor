
$(document).ready ->
  console.log "ready"
  canvas  = $("#canvas1")
  context = canvas[0].getContext("2d")

  draw = ->
    context.fillStyle = "rgb(200,0,0)"
    context.fillRect(10, 10, 55, 50)

  fitToWindow = ->
    canvas.css(left: 0, top: 0, width: window.innerWidth, height: window.innerHeight)

  $(window).resize ->
    fitToWindow()
    draw()

  fitToWindow()
  draw()
