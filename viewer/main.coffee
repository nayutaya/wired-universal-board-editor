
board_6x4 = {"nodes":[{"id":"(0,0)","x":0,"y":0},{"id":"(1,0)","x":2540,"y":0},{"id":"(2,0)","x":5080,"y":0},{"id":"(3,0)","x":7620,"y":0},{"id":"(4,0)","x":10160,"y":0},{"id":"(5,0)","x":12700,"y":0},{"id":"(0,1)","x":0,"y":2540},{"id":"(1,1)","x":2540,"y":2540},{"id":"(2,1)","x":5080,"y":2540},{"id":"(3,1)","x":7620,"y":2540},{"id":"(4,1)","x":10160,"y":2540},{"id":"(5,1)","x":12700,"y":2540},{"id":"(0,2)","x":0,"y":5080},{"id":"(1,2)","x":2540,"y":5080},{"id":"(2,2)","x":5080,"y":5080},{"id":"(3,2)","x":7620,"y":5080},{"id":"(4,2)","x":10160,"y":5080},{"id":"(5,2)","x":12700,"y":5080},{"id":"(0,3)","x":0,"y":7620},{"id":"(1,3)","x":2540,"y":7620},{"id":"(2,3)","x":5080,"y":7620},{"id":"(3,3)","x":7620,"y":7620},{"id":"(4,3)","x":10160,"y":7620},{"id":"(5,3)","x":12700,"y":7620}],"edges":[{"id":"(0,0)-(1,0)","a":"(0,0)","b":"(1,0)"},{"id":"(1,0)-(2,0)","a":"(1,0)","b":"(2,0)"},{"id":"(2,0)-(3,0)","a":"(2,0)","b":"(3,0)"},{"id":"(3,0)-(4,0)","a":"(3,0)","b":"(4,0)"},{"id":"(4,0)-(5,0)","a":"(4,0)","b":"(5,0)"},{"id":"(0,1)-(1,1)","a":"(0,1)","b":"(1,1)"},{"id":"(1,1)-(2,1)","a":"(1,1)","b":"(2,1)"},{"id":"(2,1)-(3,1)","a":"(2,1)","b":"(3,1)"},{"id":"(3,1)-(4,1)","a":"(3,1)","b":"(4,1)"},{"id":"(4,1)-(5,1)","a":"(4,1)","b":"(5,1)"},{"id":"(0,2)-(1,2)","a":"(0,2)","b":"(1,2)"},{"id":"(1,2)-(2,2)","a":"(1,2)","b":"(2,2)"},{"id":"(2,2)-(3,2)","a":"(2,2)","b":"(3,2)"},{"id":"(3,2)-(4,2)","a":"(3,2)","b":"(4,2)"},{"id":"(4,2)-(5,2)","a":"(4,2)","b":"(5,2)"},{"id":"(0,3)-(1,3)","a":"(0,3)","b":"(1,3)"},{"id":"(1,3)-(2,3)","a":"(1,3)","b":"(2,3)"},{"id":"(2,3)-(3,3)","a":"(2,3)","b":"(3,3)"},{"id":"(3,3)-(4,3)","a":"(3,3)","b":"(4,3)"},{"id":"(4,3)-(5,3)","a":"(4,3)","b":"(5,3)"},{"id":"(0,0)-(0,1)","a":"(0,0)","b":"(0,1)"},{"id":"(1,0)-(1,1)","a":"(1,0)","b":"(1,1)"},{"id":"(2,0)-(2,1)","a":"(2,0)","b":"(2,1)"},{"id":"(3,0)-(3,1)","a":"(3,0)","b":"(3,1)"},{"id":"(4,0)-(4,1)","a":"(4,0)","b":"(4,1)"},{"id":"(5,0)-(5,1)","a":"(5,0)","b":"(5,1)"},{"id":"(0,1)-(0,2)","a":"(0,1)","b":"(0,2)"},{"id":"(1,1)-(1,2)","a":"(1,1)","b":"(1,2)"},{"id":"(2,1)-(2,2)","a":"(2,1)","b":"(2,2)"},{"id":"(3,1)-(3,2)","a":"(3,1)","b":"(3,2)"},{"id":"(4,1)-(4,2)","a":"(4,1)","b":"(4,2)"},{"id":"(5,1)-(5,2)","a":"(5,1)","b":"(5,2)"},{"id":"(0,2)-(0,3)","a":"(0,2)","b":"(0,3)"},{"id":"(1,2)-(1,3)","a":"(1,2)","b":"(1,3)"},{"id":"(2,2)-(2,3)","a":"(2,2)","b":"(2,3)"},{"id":"(3,2)-(3,3)","a":"(3,2)","b":"(3,3)"},{"id":"(4,2)-(4,3)","a":"(4,2)","b":"(4,3)"},{"id":"(5,2)-(5,3)","a":"(5,2)","b":"(5,3)"}]}



class Board
  constructor: (board)->
    @nodes = (board?.nodes ? [])
    @edges = (board?.edges ? [])

    @idToNodeMap = {}
    @nodes.forEach ((node)-> @idToNodeMap[node.id] = node).bind(this)
    @idToEdgeMap = {}
    @edges.forEach ((edge)-> @idToEdgeMap[edge.id] = edge).bind(this)

    @edges.forEach ((edge)->
      edge.node1 = @getNodeById(edge.a)
      edge.node2 = @getNodeById(edge.b)
      edge.x1 = edge.node1.x
      edge.y1 = edge.node1.y
      edge.x2 = edge.node2.x
      edge.y2 = edge.node2.y
    ).bind(this)

    @nodeBounds = {}
    @nodeBounds.xMin = @nodes.map((node)-> node.x).sort((a, b)-> a - b)[0]
    @nodeBounds.xMax = @nodes.map((node)-> node.x).sort((a, b)-> b - a)[0]
    @nodeBounds.yMin = @nodes.map((node)-> node.y).sort((a, b)-> a - b)[0]
    @nodeBounds.yMax = @nodes.map((node)-> node.y).sort((a, b)-> b - a)[0]
    @nodeBounds.xDelta = @nodeBounds.xMax - @nodeBounds.xMin
    @nodeBounds.yDelta = @nodeBounds.yMax - @nodeBounds.yMin

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
    @nodeRadius = new Bacon.Bus()
    @edgeWidth  = new Bacon.Bus()
    @viewport   = new Bacon.Bus()
    @updateStageBus = new Bacon.Bus()

    # 準備完了時におけるウィンドウサイズ
    windowSizeAtReady  = $(document).asEventStream("ready")
      .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
    # リサイズ時におけるウィンドウサイズ
    windowSizeAtResize = $(window).asEventStream("resize")
      .map (e)-> {width: $(e.target).width(), height: $(e.target).height()}
    # ウィンドウサイズ
    @windowSize = windowSizeAtReady.merge(windowSizeAtResize)

    # カーソル位置
    @cursorPosition = $(@stage.canvas).asEventStream("mousemove")
      .map (e)-> {x: e.offsetX, y: e.offsetY}

    @updateStageBus.throttle(50).onValue ((v)->
      @stage.update()
    ).bind(this)

    @windowSize.onValue ((value)->
      @stage.canvas.width  = value.width
      @stage.canvas.height = value.height
      @updateStage()
    ).bind(this)

  updateStage: ->
    @updateStageBus.push(null)


class CursorShape
  constructor: (@context)->
    @shape = new createjs.Shape()
    @shape.graphics.beginStroke("green").moveTo(0, -5).lineTo(0, +5).moveTo(-5, 0).lineTo(+5, 0)

    @context.stage.addChild(@shape)

    @context.cursorPosition.onValue ((position)->
      @shape.x = position.x
      @shape.y = position.y
      @context.updateStage()
    ).bind(this)


class NodeShape
  constructor: (@context, @node)->
    @shape = new createjs.Shape()
    @color = new Bacon.Bus()

    @context.stage.addChild(@shape)

    Bacon.combineTemplate(color: @color, nodeRadius: @context.nodeRadius).onValue ((value)->
      @shape.graphics
        .clear()
        .beginFill(value.color)
        .drawCircle(0, 0, value.nodeRadius)
      @context.updateStage()
    ).bind(this)

    @context.viewport.onValue ((viewport)->
      @shape.x = viewport.physicalXToLogicalX(@node.x)
      @shape.y = viewport.physicalYToLogicalY(@node.y)
      @context.updateStage()
    ).bind(this)

    @setColor("DeepSkyBlue")

  setColor: (color)->
    @color.push(color)


class EdgeShape
  constructor: (@context, @edge)->
    @shape = new createjs.Shape()
    @color = new Bacon.Bus()

    @context.stage.addChild(@shape)

    Bacon.combineTemplate(viewport: @context.viewport, edgeWidth: @context.edgeWidth, color: @color).onValue ((value)->
      x1 = value.viewport.physicalXToLogicalX(@edge.x1)
      y1 = value.viewport.physicalYToLogicalY(@edge.y1)
      x2 = value.viewport.physicalXToLogicalX(@edge.x2)
      y2 = value.viewport.physicalYToLogicalY(@edge.y2)
      @shape.graphics
        .clear()
        .setStrokeStyle(value.edgeWidth).beginStroke(value.color)
        .moveTo(x1, y1).lineTo(x2, y2)
      @context.updateStage()
    ).bind(this)

    @setColor("red")

  setColor: (color)->
    @color.push(color)


class BackgroundShape
  constructor: (@context)->
    @shape = new createjs.Shape()

    @context.stage.addChild(@shape)

    @context.windowSize.onValue ((windowSize)->
      @shape.graphics
        .clear()
        .beginFill("#F0F0F0")
        .drawRect(0, 0, windowSize.width, windowSize.height)
      @context.updateStage()
    ).bind(this)


class BoardShape
  constructor: (@context, @board)->
    @shapeIdToNodeShapeMap = {}
    @shapeIdToEdgeShapeMap = {}

    @board.nodes
      .map ((node)-> new NodeShape(@context, node)).bind(this)
      .forEach ((nodeShape)-> @shapeIdToNodeShapeMap[nodeShape.shape.id] = nodeShape).bind(this)
    @board.edges
      .map ((edge)-> new EdgeShape(@context, edge)).bind(this)
      .forEach ((edgeShape)-> @shapeIdToEdgeShapeMap[edgeShape.shape.id] = edgeShape).bind(this)


class EnvironmentShape
  constructor: (@context)->
    @backgroundShape = new BackgroundShape(@context)
    @cursorShape     = new CursorShape(@context)


class Zoomer
  constructor: (@context, @board)->
    @defaultViewport = null
    @windowSize = @context.windowSize.onValue ((windowSize)->
      xScale = windowSize.width  / @board.nodeBounds.xDelta
      yScale = windowSize.height / @board.nodeBounds.yDelta
      scale  = Math.min(xScale, yScale) * 0.8
      @defaultViewport = new Viewport(
        scale:  scale,
        offsetX: (windowSize.width - (@board.nodeBounds.xDelta * scale))  / 2,
        offsetY: (windowSize.height - (@board.nodeBounds.yDelta * scale)) / 2)
    ).bind(this)


$(document).ready ->
  console.log "ready"

  stage   = new createjs.Stage("canvas1")
  context = new Context(stage)
  board   = new Board(board_6x4)
  zoomer  = new Zoomer(context, board)

  environmentShape = new EnvironmentShape(context)
  boardShape       = new BoardShape(context, board)

  context.nodeRadius.push(10)
  context.edgeWidth.push(3)
  setTimeout (-> console.log context.viewport.push(zoomer.defaultViewport)), 0


  shapesUnderPoint = context.cursorPosition.map (value)-> stage.getObjectsUnderPoint(value.x, value.y)
  nodeShapesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> boardShape.shapeIdToNodeShapeMap[shape.id]
      .filter (nodeShape)-> nodeShape?
  edgeShapesUnderPoint = shapesUnderPoint.map (shapes)->
    shapes
      .map (shape)-> boardShape.shapeIdToEdgeShapeMap[shape.id]
      .filter (edgeShape)-> edgeShape?

  nodeShapesUnderPoint.onValue (nodeShapes)->
    nodeShapes.forEach (nodeShape)->
      nodeShape.setColor("blue")

  edgeShapesUnderPoint.onValue (edgeShapes)->
    edgeShapes.forEach (edgeShape)->
      edgeShape.setColor("blue")


  offsetStream = $(document).asEventStream("keydown")
    .map (e)->
      {
        38: {x:   0, y: +10}, # Up
        40: {x:   0, y: -10}, # Down
        37: {x: +10, y:   0}, # Left
        39: {x: -10, y:   0}, # Right
      }[e.keyCode]
    .filter (move)-> move?
    .scan {x: 0, y: 0}, (a, b)-> {x: a.x + b.x, y: a.y + b.y}

  setTimeout (->
    defaultViewport = zoomer.defaultViewport
    offsetStream.onValue (e)->
      context.viewport.push(new Viewport(
        scale:   defaultViewport.scale,
        offsetX: defaultViewport.offsetX + e.x,
        offsetY: defaultViewport.offsetY + e.y))
  ), 0

  ###
  $(document).asEventStream("keydown").onValue (e)->
    console.log e
    switch e.keyCode
      when 38 then console.log("up")
      when 40 then console.log("down")
      when 37 then console.log("left")
      when 40 then console.log("right")
  ###
