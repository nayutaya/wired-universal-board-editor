
board_6x4 = {"nodes":[{"id":"(0,0)","x":0,"y":0},{"id":"(1,0)","x":2540,"y":0},{"id":"(2,0)","x":5080,"y":0},{"id":"(3,0)","x":7620,"y":0},{"id":"(4,0)","x":10160,"y":0},{"id":"(5,0)","x":12700,"y":0},{"id":"(0,1)","x":0,"y":2540},{"id":"(1,1)","x":2540,"y":2540},{"id":"(2,1)","x":5080,"y":2540},{"id":"(3,1)","x":7620,"y":2540},{"id":"(4,1)","x":10160,"y":2540},{"id":"(5,1)","x":12700,"y":2540},{"id":"(0,2)","x":0,"y":5080},{"id":"(1,2)","x":2540,"y":5080},{"id":"(2,2)","x":5080,"y":5080},{"id":"(3,2)","x":7620,"y":5080},{"id":"(4,2)","x":10160,"y":5080},{"id":"(5,2)","x":12700,"y":5080},{"id":"(0,3)","x":0,"y":7620},{"id":"(1,3)","x":2540,"y":7620},{"id":"(2,3)","x":5080,"y":7620},{"id":"(3,3)","x":7620,"y":7620},{"id":"(4,3)","x":10160,"y":7620},{"id":"(5,3)","x":12700,"y":7620}],"edges":[{"id":"(0,0)-(1,0)","a":"(0,0)","b":"(1,0)"},{"id":"(1,0)-(2,0)","a":"(1,0)","b":"(2,0)"},{"id":"(2,0)-(3,0)","a":"(2,0)","b":"(3,0)"},{"id":"(3,0)-(4,0)","a":"(3,0)","b":"(4,0)"},{"id":"(4,0)-(5,0)","a":"(4,0)","b":"(5,0)"},{"id":"(0,1)-(1,1)","a":"(0,1)","b":"(1,1)"},{"id":"(1,1)-(2,1)","a":"(1,1)","b":"(2,1)"},{"id":"(2,1)-(3,1)","a":"(2,1)","b":"(3,1)"},{"id":"(3,1)-(4,1)","a":"(3,1)","b":"(4,1)"},{"id":"(4,1)-(5,1)","a":"(4,1)","b":"(5,1)"},{"id":"(0,2)-(1,2)","a":"(0,2)","b":"(1,2)"},{"id":"(1,2)-(2,2)","a":"(1,2)","b":"(2,2)"},{"id":"(2,2)-(3,2)","a":"(2,2)","b":"(3,2)"},{"id":"(3,2)-(4,2)","a":"(3,2)","b":"(4,2)"},{"id":"(4,2)-(5,2)","a":"(4,2)","b":"(5,2)"},{"id":"(0,3)-(1,3)","a":"(0,3)","b":"(1,3)"},{"id":"(1,3)-(2,3)","a":"(1,3)","b":"(2,3)"},{"id":"(2,3)-(3,3)","a":"(2,3)","b":"(3,3)"},{"id":"(3,3)-(4,3)","a":"(3,3)","b":"(4,3)"},{"id":"(4,3)-(5,3)","a":"(4,3)","b":"(5,3)"},{"id":"(0,0)-(0,1)","a":"(0,0)","b":"(0,1)"},{"id":"(1,0)-(1,1)","a":"(1,0)","b":"(1,1)"},{"id":"(2,0)-(2,1)","a":"(2,0)","b":"(2,1)"},{"id":"(3,0)-(3,1)","a":"(3,0)","b":"(3,1)"},{"id":"(4,0)-(4,1)","a":"(4,0)","b":"(4,1)"},{"id":"(5,0)-(5,1)","a":"(5,0)","b":"(5,1)"},{"id":"(0,1)-(0,2)","a":"(0,1)","b":"(0,2)"},{"id":"(1,1)-(1,2)","a":"(1,1)","b":"(1,2)"},{"id":"(2,1)-(2,2)","a":"(2,1)","b":"(2,2)"},{"id":"(3,1)-(3,2)","a":"(3,1)","b":"(3,2)"},{"id":"(4,1)-(4,2)","a":"(4,1)","b":"(4,2)"},{"id":"(5,1)-(5,2)","a":"(5,1)","b":"(5,2)"},{"id":"(0,2)-(0,3)","a":"(0,2)","b":"(0,3)"},{"id":"(1,2)-(1,3)","a":"(1,2)","b":"(1,3)"},{"id":"(2,2)-(2,3)","a":"(2,2)","b":"(2,3)"},{"id":"(3,2)-(3,3)","a":"(3,2)","b":"(3,3)"},{"id":"(4,2)-(4,3)","a":"(4,2)","b":"(4,3)"},{"id":"(5,2)-(5,3)","a":"(5,2)","b":"(5,3)"}]}



class Board
  constructor: (board)->
    self = this
    self.nodes = (board?.nodes ? [])
    self.edges = (board?.edges ? [])

    self.idToNodeMap = {}
    self.nodes.forEach (node)-> self.idToNodeMap[node.id] = node
    self.idToEdgeMap = {}
    self.edges.forEach (edge)-> self.idToEdgeMap[edge.id] = edge

    self.edges.forEach (edge)->
      edge.node1 = self.getNodeById(edge.a)
      edge.node2 = self.getNodeById(edge.b)
      edge.x1 = edge.node1.x
      edge.y1 = edge.node1.y
      edge.x2 = edge.node2.x
      edge.y2 = edge.node2.y

  getNodeById: (id)->
    return @idToNodeMap[id]

  getEdgeById: (id)->
    return @idToEdgeMap[id]


class Viewport
  constructor: (options)->
    @scale   = options?.scale
    @offsetX = options?.offsetX
    @offsetY = options?.offsetY

  physicalXToLogicalX: (value)-> (value * @scale) + @offsetX
  physicalYToLogicalY: (value)-> (value * @scale) + @offsetY
  logicalXToPhysicalX: (value)-> (value - @offsetX) / @scale
  logicalYToPhysicalY: (value)-> (value - @offsetY) / @scale


class Context
  constructor: (@stage)->
    self = this
    self.nodeRadius = new Bacon.Bus()
    self.edgeWidth  = new Bacon.Bus()
    self.viewport   = new Bacon.Bus()
    self.updateStageBus = new Bacon.Bus()

    # 準備完了時におけるウィンドウサイズ
    windowSizeAtReady  = $(document).asEventStream("ready")
      .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
    # リサイズ時におけるウィンドウサイズ
    windowSizeAtResize = $(window).asEventStream("resize")
      .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
    # ウィンドウサイズ
    self.windowSize = windowSizeAtReady.merge(windowSizeAtResize)

    self.updateStageBus.throttle(50).onValue (v)->
      self.stage.update()

  updateStage: ->
    @updateStageBus.push(null)


class CursorShape
  constructor: (@context, position)->
    @shape = new createjs.Shape()
    @shape.graphics.beginStroke("green").moveTo(0, -5).lineTo(0, +5).moveTo(-5, 0).lineTo(+5, 0)

    self = this
    position.onValue (position)->
      self.shape.x = position.x
      self.shape.y = position.y
      self.context.updateStage()

class NodeShape
  constructor: (@context, @node)->
    self = this
    self.shape = new createjs.Shape()
    self.color = new Bacon.Bus()

    Bacon.combineTemplate(color: self.color, nodeRadius: self.context.nodeRadius).onValue (value)->
      self.shape.graphics
        .clear()
        .beginFill(value.color)
        .drawCircle(0, 0, value.nodeRadius)
      self.context.updateStage()

    self.context.viewport.onValue (viewport)->
      self.shape.x = viewport.physicalXToLogicalX(self.node.x)
      self.shape.y = viewport.physicalYToLogicalY(self.node.y)
      self.context.updateStage()

    self.setColor("DeepSkyBlue")

  setColor: (color)->
    this.color.push(color)

class EdgeShape
  constructor: (@context, @edge)->
    self = this
    self.shape = new createjs.Shape()
    self.color = new Bacon.Bus()

    Bacon.combineTemplate(viewport: self.context.viewport, edgeWidth: self.context.edgeWidth, color: @color).onValue (value)->
      x1 = value.viewport.physicalXToLogicalX(self.edge.x1)
      y1 = value.viewport.physicalYToLogicalY(self.edge.y1)
      x2 = value.viewport.physicalXToLogicalX(self.edge.x2)
      y2 = value.viewport.physicalYToLogicalY(self.edge.y2)
      self.shape.graphics
        .clear()
        .setStrokeStyle(value.edgeWidth).beginStroke(value.color)
        .moveTo(x1, y1).lineTo(x2, y2)
      self.context.updateStage()

    self.setColor("red")

  setColor: (color)->
    this.color.push(color)

$(document).ready ->
  console.log "ready"

  stage   = new createjs.Stage("canvas1")
  context = new Context(stage)

  board = new Board(board_6x4)
  console.log board

  shapeIdToNodeShapeMap = {}
  board.nodes.forEach (node)->
    nodeShape = new NodeShape(context, node)
    stage.addChild(nodeShape.shape)
    shapeIdToNodeShapeMap[nodeShape.shape.id] = nodeShape

  shapeIdToEdgeShapeMap = {}
  board.edges.forEach (edge)->
    edgeShape = new EdgeShape(context, edge)
    stage.addChild(edgeShape.shape)
    shapeIdToEdgeShapeMap[edgeShape.shape.id] = edgeShape


  context.nodeRadius.push(10)
  context.edgeWidth.push(3)
  context.viewport.push(new Viewport(scale: 1.0 / 1000 * 20, offsetX: 0, offsetY: 0))

  cursorPosition = $("#canvas1").asEventStream("mousemove")
    .map (e)-> {x: e.offsetX, y: e.offsetY}

  cursorShape = new CursorShape(context, cursorPosition)
  stage.addChild(cursorShape.shape)

  context.updateStage()


  shapesUnderPoint = cursorPosition.map (value)-> stage.getObjectsUnderPoint(value.x, value.y)
  nodeShapesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> shapeIdToNodeShapeMap[shape.id]
      .filter (nodeShape)-> nodeShape?
  edgeShapesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> shapeIdToEdgeShapeMap[shape.id]
      .filter (edgeShape)-> edgeShape?

  nodeShapesUnderPoint.onValue (nodeShapes)->
    nodeShapes.forEach (nodeShape)->
      nodeShape.setColor("blue")

  edgeShapesUnderPoint.onValue (edgeShapes)->
    edgeShapes.forEach (edgeShape)->
      edgeShape.setColor("blue")


  context.windowSize.onValue (value)->
    stage.canvas.width  = value.width
    stage.canvas.height = value.height
    context.updateStage()

  moveTable = {
    38: {x: 0, y: +10}, # Up
    40: {x: 0, y: -10}, # Down
    37: {x: +10, y: 0}, # Left
    39: {x: -10, y: 0}, # Right
  }

  offsetStream = $(document).asEventStream("keydown")
    .map (e)-> moveTable[e.keyCode] ? {x: 0, y: 0}
    .scan {x: 0, y: 0}, (a, b)-> {x: a.x + b.x, y: a.y + b.y}

  offsetStream.onValue (e)->
    context.viewport.push(new Viewport(scale: 1.0 / 1000 * 20, offsetX: e.x, offsetY: e.y))

  $(document).asEventStream("keydown").onValue (e)->
    # console.log e
    switch e.keyCode
      when 38
        console.log("up")
        # viewport.push(new Viewport(scale: 1.0 / 1000 * 30))
        # viewport.push(new Viewport(scale: 1.0 / 1000 * 20, offsetX: 50, offsetY: 0))
      when 40
        console.log("down")
        # nodeRadius.push(20)
      when 37 then console.log("left")
      when 40 then console.log("right")
