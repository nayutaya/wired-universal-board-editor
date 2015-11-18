
board_6x4 = {"nodes":[{"id":"(0,0)","x":0,"y":0},{"id":"(1,0)","x":2540,"y":0},{"id":"(2,0)","x":5080,"y":0},{"id":"(3,0)","x":7620,"y":0},{"id":"(4,0)","x":10160,"y":0},{"id":"(5,0)","x":12700,"y":0},{"id":"(0,1)","x":0,"y":2540},{"id":"(1,1)","x":2540,"y":2540},{"id":"(2,1)","x":5080,"y":2540},{"id":"(3,1)","x":7620,"y":2540},{"id":"(4,1)","x":10160,"y":2540},{"id":"(5,1)","x":12700,"y":2540},{"id":"(0,2)","x":0,"y":5080},{"id":"(1,2)","x":2540,"y":5080},{"id":"(2,2)","x":5080,"y":5080},{"id":"(3,2)","x":7620,"y":5080},{"id":"(4,2)","x":10160,"y":5080},{"id":"(5,2)","x":12700,"y":5080},{"id":"(0,3)","x":0,"y":7620},{"id":"(1,3)","x":2540,"y":7620},{"id":"(2,3)","x":5080,"y":7620},{"id":"(3,3)","x":7620,"y":7620},{"id":"(4,3)","x":10160,"y":7620},{"id":"(5,3)","x":12700,"y":7620}],"edges":[{"id":"(0,0)-(1,0)","a":"(0,0)","b":"(1,0)"},{"id":"(1,0)-(2,0)","a":"(1,0)","b":"(2,0)"},{"id":"(2,0)-(3,0)","a":"(2,0)","b":"(3,0)"},{"id":"(3,0)-(4,0)","a":"(3,0)","b":"(4,0)"},{"id":"(4,0)-(5,0)","a":"(4,0)","b":"(5,0)"},{"id":"(0,1)-(1,1)","a":"(0,1)","b":"(1,1)"},{"id":"(1,1)-(2,1)","a":"(1,1)","b":"(2,1)"},{"id":"(2,1)-(3,1)","a":"(2,1)","b":"(3,1)"},{"id":"(3,1)-(4,1)","a":"(3,1)","b":"(4,1)"},{"id":"(4,1)-(5,1)","a":"(4,1)","b":"(5,1)"},{"id":"(0,2)-(1,2)","a":"(0,2)","b":"(1,2)"},{"id":"(1,2)-(2,2)","a":"(1,2)","b":"(2,2)"},{"id":"(2,2)-(3,2)","a":"(2,2)","b":"(3,2)"},{"id":"(3,2)-(4,2)","a":"(3,2)","b":"(4,2)"},{"id":"(4,2)-(5,2)","a":"(4,2)","b":"(5,2)"},{"id":"(0,3)-(1,3)","a":"(0,3)","b":"(1,3)"},{"id":"(1,3)-(2,3)","a":"(1,3)","b":"(2,3)"},{"id":"(2,3)-(3,3)","a":"(2,3)","b":"(3,3)"},{"id":"(3,3)-(4,3)","a":"(3,3)","b":"(4,3)"},{"id":"(4,3)-(5,3)","a":"(4,3)","b":"(5,3)"},{"id":"(0,0)-(0,1)","a":"(0,0)","b":"(0,1)"},{"id":"(1,0)-(1,1)","a":"(1,0)","b":"(1,1)"},{"id":"(2,0)-(2,1)","a":"(2,0)","b":"(2,1)"},{"id":"(3,0)-(3,1)","a":"(3,0)","b":"(3,1)"},{"id":"(4,0)-(4,1)","a":"(4,0)","b":"(4,1)"},{"id":"(5,0)-(5,1)","a":"(5,0)","b":"(5,1)"},{"id":"(0,1)-(0,2)","a":"(0,1)","b":"(0,2)"},{"id":"(1,1)-(1,2)","a":"(1,1)","b":"(1,2)"},{"id":"(2,1)-(2,2)","a":"(2,1)","b":"(2,2)"},{"id":"(3,1)-(3,2)","a":"(3,1)","b":"(3,2)"},{"id":"(4,1)-(4,2)","a":"(4,1)","b":"(4,2)"},{"id":"(5,1)-(5,2)","a":"(5,1)","b":"(5,2)"},{"id":"(0,2)-(0,3)","a":"(0,2)","b":"(0,3)"},{"id":"(1,2)-(1,3)","a":"(1,2)","b":"(1,3)"},{"id":"(2,2)-(2,3)","a":"(2,2)","b":"(2,3)"},{"id":"(3,2)-(3,3)","a":"(3,2)","b":"(3,3)"},{"id":"(4,2)-(4,3)","a":"(4,2)","b":"(4,3)"},{"id":"(5,2)-(5,3)","a":"(5,2)","b":"(5,3)"}]}

nodeRadius = Bacon.constant(10)
edgeWidth  = Bacon.constant(3)
viewPort   = Bacon.constant({scale: 0.001, offsetX: 0, offsetY: 0})

# 準備完了時におけるウィンドウサイズ
windowSizeAtReady  = $(document).asEventStream("ready")
  .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
# リサイズ時におけるウィンドウサイズ
windowSizeAtResize = $(window).asEventStream("resize")
  .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
# ウィンドウサイズ
windowSize = windowSizeAtReady.merge(windowSizeAtResize)


class Board
  constructor: (board)->
    @nodes = (board?.nodes ? [])
    @edges = (board?.edges ? [])

    @idToNodeMap = {}
    @nodes.forEach ((node)-> @idToNodeMap[node.id] = node), this
    @idToEdgeMap = {}
    @edges.forEach ((edge)-> @idToEdgeMap[edge.id] = edge), this

  getNodeById: (id)->
    return @idToNodeMap[id]

  getEdgeById: (id)->
    return @idToEdgeMap[id]


$(document).ready ->
  console.log "ready"

  stage = new createjs.Stage("canvas1")

  stageUpdate = (->
      stageUpdateBus = new Bacon.Bus()
      stageUpdateBus.throttle(50).onValue (v)->
        stage.update()
      return -> stageUpdateBus.push(null)
    )()

  board = new Board(board_6x4)
  console.log board

  micrometerToPixel = (value)-> value / 1000 * 20

  nodeShapeMap = {}
  shapeIdToNodeMap = {}
  board.nodes.forEach (node)->
    x = micrometerToPixel(node.x)
    y = micrometerToPixel(node.y)
    r = 10

    shape = new createjs.Shape()
    shape.graphics.beginFill("DeepSkyBlue").drawCircle(0, 0, r)
    shape.x = x
    shape.y = y
    stage.addChild(shape)
    nodeShapeMap[node.id] = shape
    shapeIdToNodeMap[shape.id] = node

  edgeShapeMap = {}
  shapeIdToEdgeMap = {}
  board.edges.forEach (edge)->
    x1 = micrometerToPixel(board.getNodeById(edge.a).x)
    y1 = micrometerToPixel(board.getNodeById(edge.a).y)
    x2 = micrometerToPixel(board.getNodeById(edge.b).x)
    y2 = micrometerToPixel(board.getNodeById(edge.b).y)

    shape = new createjs.Shape()
    shape.graphics.setStrokeStyle(3).beginStroke("red").moveTo(x1, y1).lineTo(x2, y2)
    stage.addChild(shape)
    edgeShapeMap[edge.id] = shape
    shapeIdToEdgeMap[shape.id] = edge

    # $(shape).asEventStream("click").onValue (e)-> console.log e

  cursor = new createjs.Shape()
  cursor.graphics.beginStroke("green").moveTo(0, -5).lineTo(0, +5).moveTo(-5, 0).lineTo(+5, 0)
  stage.addChild(cursor)


  stageUpdate()

  cursorPosition = $("#canvas1").asEventStream("mousemove")
    .map (e)-> {x: e.offsetX, y: e.offsetY}

  cursorPosition.onValue (value)->
    cursor.x = value.x
    cursor.y = value.y
    stageUpdate()

  logicalToPhysical = (value)-> value / 20 * 1000

  shapesUnderPoint = cursorPosition.map (value)-> stage.getObjectsUnderPoint(value.x, value.y)
  nodesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> shapeIdToNodeMap[shape.id]
      .filter (node)-> node?
  edgesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> shapeIdToEdgeMap[shape.id]
      .filter (edge)-> edge?

  nodesUnderPoint.onValue (nodes)->
    # console.log "nodesUnderPoint:"
    # console.log nodes
    nodes.forEach (node)->
      shape = nodeShapeMap[node.id]
      shape.graphics.clear().beginFill("blue").drawCircle(0, 0, 10)
    stageUpdate()

  edgesUnderPoint.onValue (edges)->
    # console.log "edgesUnderPoint"
    # console.log edges
    edges.forEach (edge)->
      x1 = micrometerToPixel(board.getNodeById(edge.a).x)
      y1 = micrometerToPixel(board.getNodeById(edge.a).y)
      x2 = micrometerToPixel(board.getNodeById(edge.b).x)
      y2 = micrometerToPixel(board.getNodeById(edge.b).y)

      shape = edgeShapeMap[edge.id]
      shape.graphics.clear().setStrokeStyle(3).beginStroke("blue").moveTo(x1, y1).lineTo(x2, y2)
    stageUpdate()


  windowSize.onValue (value)->
    stage.canvas.width  = value.width
    stage.canvas.height = value.height
    stageUpdate()

  $(document).asEventStream("keydown").onValue (e)->
    # console.log e
    switch e.keyCode
      when 38 then console.log("up")
      when 40 then console.log("down")
      when 37 then console.log("left")
      when 40 then console.log("right")
