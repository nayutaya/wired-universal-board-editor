
board_6x4 = {"nodes":[{"id":"(0,0)","x":0,"y":0},{"id":"(1,0)","x":2540,"y":0},{"id":"(2,0)","x":5080,"y":0},{"id":"(3,0)","x":7620,"y":0},{"id":"(4,0)","x":10160,"y":0},{"id":"(5,0)","x":12700,"y":0},{"id":"(0,1)","x":0,"y":2540},{"id":"(1,1)","x":2540,"y":2540},{"id":"(2,1)","x":5080,"y":2540},{"id":"(3,1)","x":7620,"y":2540},{"id":"(4,1)","x":10160,"y":2540},{"id":"(5,1)","x":12700,"y":2540},{"id":"(0,2)","x":0,"y":5080},{"id":"(1,2)","x":2540,"y":5080},{"id":"(2,2)","x":5080,"y":5080},{"id":"(3,2)","x":7620,"y":5080},{"id":"(4,2)","x":10160,"y":5080},{"id":"(5,2)","x":12700,"y":5080},{"id":"(0,3)","x":0,"y":7620},{"id":"(1,3)","x":2540,"y":7620},{"id":"(2,3)","x":5080,"y":7620},{"id":"(3,3)","x":7620,"y":7620},{"id":"(4,3)","x":10160,"y":7620},{"id":"(5,3)","x":12700,"y":7620}],"edges":[{"id":"(0,0)-(1,0)","a":"(0,0)","b":"(1,0)"},{"id":"(1,0)-(2,0)","a":"(1,0)","b":"(2,0)"},{"id":"(2,0)-(3,0)","a":"(2,0)","b":"(3,0)"},{"id":"(3,0)-(4,0)","a":"(3,0)","b":"(4,0)"},{"id":"(4,0)-(5,0)","a":"(4,0)","b":"(5,0)"},{"id":"(0,1)-(1,1)","a":"(0,1)","b":"(1,1)"},{"id":"(1,1)-(2,1)","a":"(1,1)","b":"(2,1)"},{"id":"(2,1)-(3,1)","a":"(2,1)","b":"(3,1)"},{"id":"(3,1)-(4,1)","a":"(3,1)","b":"(4,1)"},{"id":"(4,1)-(5,1)","a":"(4,1)","b":"(5,1)"},{"id":"(0,2)-(1,2)","a":"(0,2)","b":"(1,2)"},{"id":"(1,2)-(2,2)","a":"(1,2)","b":"(2,2)"},{"id":"(2,2)-(3,2)","a":"(2,2)","b":"(3,2)"},{"id":"(3,2)-(4,2)","a":"(3,2)","b":"(4,2)"},{"id":"(4,2)-(5,2)","a":"(4,2)","b":"(5,2)"},{"id":"(0,3)-(1,3)","a":"(0,3)","b":"(1,3)"},{"id":"(1,3)-(2,3)","a":"(1,3)","b":"(2,3)"},{"id":"(2,3)-(3,3)","a":"(2,3)","b":"(3,3)"},{"id":"(3,3)-(4,3)","a":"(3,3)","b":"(4,3)"},{"id":"(4,3)-(5,3)","a":"(4,3)","b":"(5,3)"},{"id":"(0,0)-(0,1)","a":"(0,0)","b":"(0,1)"},{"id":"(1,0)-(1,1)","a":"(1,0)","b":"(1,1)"},{"id":"(2,0)-(2,1)","a":"(2,0)","b":"(2,1)"},{"id":"(3,0)-(3,1)","a":"(3,0)","b":"(3,1)"},{"id":"(4,0)-(4,1)","a":"(4,0)","b":"(4,1)"},{"id":"(5,0)-(5,1)","a":"(5,0)","b":"(5,1)"},{"id":"(0,1)-(0,2)","a":"(0,1)","b":"(0,2)"},{"id":"(1,1)-(1,2)","a":"(1,1)","b":"(1,2)"},{"id":"(2,1)-(2,2)","a":"(2,1)","b":"(2,2)"},{"id":"(3,1)-(3,2)","a":"(3,1)","b":"(3,2)"},{"id":"(4,1)-(4,2)","a":"(4,1)","b":"(4,2)"},{"id":"(5,1)-(5,2)","a":"(5,1)","b":"(5,2)"},{"id":"(0,2)-(0,3)","a":"(0,2)","b":"(0,3)"},{"id":"(1,2)-(1,3)","a":"(1,2)","b":"(1,3)"},{"id":"(2,2)-(2,3)","a":"(2,2)","b":"(2,3)"},{"id":"(3,2)-(3,3)","a":"(3,2)","b":"(3,3)"},{"id":"(4,2)-(4,3)","a":"(4,2)","b":"(4,3)"},{"id":"(5,2)-(5,3)","a":"(5,2)","b":"(5,3)"}]}

console.log board_6x4

$(document).ready ->
  console.log "ready"

  stage = new createjs.Stage("canvas1")
  console.log stage

  board = board_6x4
  nodeMap = {}
  nodes = (board?.nodes ? [])
  nodes.forEach (node)-> nodeMap[node.id] = node
  edgeMap = {}
  edges = (board?.edges ? [])
  edges.forEach (edge)-> edgeMap[edge.id] = edge

  nodeCircleMap = {}
  nodes.forEach (node)->
    x = node.x / 1000 * 20 + 20
    y = node.y / 1000 * 20 + 20
    r = 10

    circle = new createjs.Shape()
    circle.graphics.beginFill("DeepSkyBlue").drawCircle(x, y, r)
    stage.addChild(circle)
    nodeCircleMap[node.id] = circle

  stage.update()

  $(window).resize (e)->
    stage.canvas.width  = $(e.target).width()
    stage.canvas.height = $(e.target).height()
    stage.update()

  $(window).trigger("resize")
