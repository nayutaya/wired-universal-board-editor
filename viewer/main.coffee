
$(document).ready ->
  console.log "ready"

  stage = new createjs.Stage("canvas1")
  console.log stage

  circle = new createjs.Shape()
  circle.graphics.beginFill("DeepSkyBlue").drawCircle(0, 0, 50)
  circle.x = 100
  circle.y = 100
  stage.addChild(circle)

  stage.update()

  $(window).resize (e)->
    stage.canvas.width  = $(e.target).width()
    stage.canvas.height = $(e.target).height()
    stage.update()

  $(window).trigger("resize")
