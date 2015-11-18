// Generated by CoffeeScript 1.9.3
(function() {
  var Board, NodeShape, Viewport, board_6x4, edgeWidth, nodeRadius, viewPort, windowSize, windowSizeAtReady, windowSizeAtResize;

  board_6x4 = {
    "nodes": [
      {
        "id": "(0,0)",
        "x": 0,
        "y": 0
      }, {
        "id": "(1,0)",
        "x": 2540,
        "y": 0
      }, {
        "id": "(2,0)",
        "x": 5080,
        "y": 0
      }, {
        "id": "(3,0)",
        "x": 7620,
        "y": 0
      }, {
        "id": "(4,0)",
        "x": 10160,
        "y": 0
      }, {
        "id": "(5,0)",
        "x": 12700,
        "y": 0
      }, {
        "id": "(0,1)",
        "x": 0,
        "y": 2540
      }, {
        "id": "(1,1)",
        "x": 2540,
        "y": 2540
      }, {
        "id": "(2,1)",
        "x": 5080,
        "y": 2540
      }, {
        "id": "(3,1)",
        "x": 7620,
        "y": 2540
      }, {
        "id": "(4,1)",
        "x": 10160,
        "y": 2540
      }, {
        "id": "(5,1)",
        "x": 12700,
        "y": 2540
      }, {
        "id": "(0,2)",
        "x": 0,
        "y": 5080
      }, {
        "id": "(1,2)",
        "x": 2540,
        "y": 5080
      }, {
        "id": "(2,2)",
        "x": 5080,
        "y": 5080
      }, {
        "id": "(3,2)",
        "x": 7620,
        "y": 5080
      }, {
        "id": "(4,2)",
        "x": 10160,
        "y": 5080
      }, {
        "id": "(5,2)",
        "x": 12700,
        "y": 5080
      }, {
        "id": "(0,3)",
        "x": 0,
        "y": 7620
      }, {
        "id": "(1,3)",
        "x": 2540,
        "y": 7620
      }, {
        "id": "(2,3)",
        "x": 5080,
        "y": 7620
      }, {
        "id": "(3,3)",
        "x": 7620,
        "y": 7620
      }, {
        "id": "(4,3)",
        "x": 10160,
        "y": 7620
      }, {
        "id": "(5,3)",
        "x": 12700,
        "y": 7620
      }
    ],
    "edges": [
      {
        "id": "(0,0)-(1,0)",
        "a": "(0,0)",
        "b": "(1,0)"
      }, {
        "id": "(1,0)-(2,0)",
        "a": "(1,0)",
        "b": "(2,0)"
      }, {
        "id": "(2,0)-(3,0)",
        "a": "(2,0)",
        "b": "(3,0)"
      }, {
        "id": "(3,0)-(4,0)",
        "a": "(3,0)",
        "b": "(4,0)"
      }, {
        "id": "(4,0)-(5,0)",
        "a": "(4,0)",
        "b": "(5,0)"
      }, {
        "id": "(0,1)-(1,1)",
        "a": "(0,1)",
        "b": "(1,1)"
      }, {
        "id": "(1,1)-(2,1)",
        "a": "(1,1)",
        "b": "(2,1)"
      }, {
        "id": "(2,1)-(3,1)",
        "a": "(2,1)",
        "b": "(3,1)"
      }, {
        "id": "(3,1)-(4,1)",
        "a": "(3,1)",
        "b": "(4,1)"
      }, {
        "id": "(4,1)-(5,1)",
        "a": "(4,1)",
        "b": "(5,1)"
      }, {
        "id": "(0,2)-(1,2)",
        "a": "(0,2)",
        "b": "(1,2)"
      }, {
        "id": "(1,2)-(2,2)",
        "a": "(1,2)",
        "b": "(2,2)"
      }, {
        "id": "(2,2)-(3,2)",
        "a": "(2,2)",
        "b": "(3,2)"
      }, {
        "id": "(3,2)-(4,2)",
        "a": "(3,2)",
        "b": "(4,2)"
      }, {
        "id": "(4,2)-(5,2)",
        "a": "(4,2)",
        "b": "(5,2)"
      }, {
        "id": "(0,3)-(1,3)",
        "a": "(0,3)",
        "b": "(1,3)"
      }, {
        "id": "(1,3)-(2,3)",
        "a": "(1,3)",
        "b": "(2,3)"
      }, {
        "id": "(2,3)-(3,3)",
        "a": "(2,3)",
        "b": "(3,3)"
      }, {
        "id": "(3,3)-(4,3)",
        "a": "(3,3)",
        "b": "(4,3)"
      }, {
        "id": "(4,3)-(5,3)",
        "a": "(4,3)",
        "b": "(5,3)"
      }, {
        "id": "(0,0)-(0,1)",
        "a": "(0,0)",
        "b": "(0,1)"
      }, {
        "id": "(1,0)-(1,1)",
        "a": "(1,0)",
        "b": "(1,1)"
      }, {
        "id": "(2,0)-(2,1)",
        "a": "(2,0)",
        "b": "(2,1)"
      }, {
        "id": "(3,0)-(3,1)",
        "a": "(3,0)",
        "b": "(3,1)"
      }, {
        "id": "(4,0)-(4,1)",
        "a": "(4,0)",
        "b": "(4,1)"
      }, {
        "id": "(5,0)-(5,1)",
        "a": "(5,0)",
        "b": "(5,1)"
      }, {
        "id": "(0,1)-(0,2)",
        "a": "(0,1)",
        "b": "(0,2)"
      }, {
        "id": "(1,1)-(1,2)",
        "a": "(1,1)",
        "b": "(1,2)"
      }, {
        "id": "(2,1)-(2,2)",
        "a": "(2,1)",
        "b": "(2,2)"
      }, {
        "id": "(3,1)-(3,2)",
        "a": "(3,1)",
        "b": "(3,2)"
      }, {
        "id": "(4,1)-(4,2)",
        "a": "(4,1)",
        "b": "(4,2)"
      }, {
        "id": "(5,1)-(5,2)",
        "a": "(5,1)",
        "b": "(5,2)"
      }, {
        "id": "(0,2)-(0,3)",
        "a": "(0,2)",
        "b": "(0,3)"
      }, {
        "id": "(1,2)-(1,3)",
        "a": "(1,2)",
        "b": "(1,3)"
      }, {
        "id": "(2,2)-(2,3)",
        "a": "(2,2)",
        "b": "(2,3)"
      }, {
        "id": "(3,2)-(3,3)",
        "a": "(3,2)",
        "b": "(3,3)"
      }, {
        "id": "(4,2)-(4,3)",
        "a": "(4,2)",
        "b": "(4,3)"
      }, {
        "id": "(5,2)-(5,3)",
        "a": "(5,2)",
        "b": "(5,3)"
      }
    ]
  };

  nodeRadius = new Bacon.Bus();

  edgeWidth = Bacon.constant(3);

  viewPort = Bacon.constant({
    scale: 0.001,
    offsetX: 0,
    offsetY: 0
  });

  windowSizeAtReady = $(document).asEventStream("ready").map(function(e) {
    return {
      width: $(e.target).width(),
      height: $(e.target).height()
    };
  });

  windowSizeAtResize = $(window).asEventStream("resize").map(function(e) {
    return {
      width: $(e.target).width(),
      height: $(e.target).height()
    };
  });

  windowSize = windowSizeAtReady.merge(windowSizeAtResize);

  Board = (function() {
    function Board(board) {
      var ref, ref1, self;
      this.nodes = (ref = board != null ? board.nodes : void 0) != null ? ref : [];
      this.edges = (ref1 = board != null ? board.edges : void 0) != null ? ref1 : [];
      self = this;
      this.idToNodeMap = {};
      this.nodes.forEach(function(node) {
        return self.idToNodeMap[node.id] = node;
      });
      this.idToEdgeMap = {};
      this.edges.forEach(function(edge) {
        return self.idToEdgeMap[edge.id] = edge;
      });
      this.edges.forEach(function(edge) {
        edge.node1 = self.getNodeById(edge.a);
        edge.node2 = self.getNodeById(edge.b);
        edge.x1 = edge.node1.x;
        edge.y1 = edge.node1.y;
        edge.x2 = edge.node2.x;
        return edge.y2 = edge.node2.y;
      });
    }

    Board.prototype.getNodeById = function(id) {
      return this.idToNodeMap[id];
    };

    Board.prototype.getEdgeById = function(id) {
      return this.idToEdgeMap[id];
    };

    return Board;

  })();

  Viewport = (function() {
    function Viewport(options) {
      this.scale = options != null ? options.scale : void 0;
    }

    Viewport.prototype.physicalToLogical = function(value) {
      return value * this.scale;
    };

    Viewport.prototype.logicalToPhysical = function(value) {
      return value / this.scale;
    };

    return Viewport;

  })();

  NodeShape = (function() {
    function NodeShape(node1, viewport, nodeRadius) {
      var color, self;
      this.node = node1;
      this.shape = new createjs.Shape();
      self = this;
      color = "DeepSkyBlue";
      nodeRadius.onValue(function(nodeRadius) {
        console.log("nodeRadius: " + nodeRadius);
        return self.shape.graphics.clear().beginFill(color).drawCircle(0, 0, nodeRadius);
      });
      viewport.onValue(function(viewport) {
        console.log("viewport: " + viewport);
        self.shape.x = viewport.physicalToLogical(self.node.x);
        return self.shape.y = viewport.physicalToLogical(self.node.y);
      });
    }

    return NodeShape;

  })();

  $(document).ready(function() {
    var board, cursor, cursorPosition, logicalToPhysical, shapeIdToNodeShapeMap, shapesUnderPoint, stage, stageUpdate, viewport;
    console.log("ready");
    stage = new createjs.Stage("canvas1");
    stageUpdate = (function() {
      var stageUpdateBus;
      stageUpdateBus = new Bacon.Bus();
      stageUpdateBus.throttle(50).onValue(function(v) {
        return stage.update();
      });
      return function() {
        return stageUpdateBus.push(null);
      };
    })();
    board = new Board(board_6x4);
    console.log(board);
    viewport = new Bacon.Bus();
    shapeIdToNodeShapeMap = {};
    board.nodes.forEach(function(node) {
      var nodeShape;
      nodeShape = new NodeShape(node, viewport, nodeRadius);
      stage.addChild(nodeShape.shape);
      return shapeIdToNodeShapeMap[nodeShape.shape.id] = nodeShape;
    });
    nodeRadius.push(10);
    viewport.push(new Viewport({
      scale: 1.0 / 1000 * 20
    }));

    /*
    edgeShapeMap = {}
    shapeIdToEdgeMap = {}
    board.edges.forEach (edge)->
      x1 = viewport.physicalToLogical(edge.x1)
      y1 = viewport.physicalToLogical(edge.y1)
      x2 = viewport.physicalToLogical(edge.x2)
      y2 = viewport.physicalToLogical(edge.y2)
    
      shape = new createjs.Shape()
      shape.graphics.setStrokeStyle(3).beginStroke("red").moveTo(x1, y1).lineTo(x2, y2)
      stage.addChild(shape)
      edgeShapeMap[edge.id] = shape
      shapeIdToEdgeMap[shape.id] = edge
    
       * $(shape).asEventStream("click").onValue (e)-> console.log e
     */
    cursor = new createjs.Shape();
    cursor.graphics.beginStroke("green").moveTo(0, -5).lineTo(0, +5).moveTo(-5, 0).lineTo(+5, 0);
    stage.addChild(cursor);
    stageUpdate();
    cursorPosition = $("#canvas1").asEventStream("mousemove").map(function(e) {
      return {
        x: e.offsetX,
        y: e.offsetY
      };
    });
    cursorPosition.onValue(function(value) {
      cursor.x = value.x;
      cursor.y = value.y;
      return stageUpdate();
    });
    logicalToPhysical = function(value) {
      return value / 20 * 1000;
    };
    shapesUnderPoint = cursorPosition.map(function(value) {
      return stage.getObjectsUnderPoint(value.x, value.y);
    });

    /*
    nodesUnderPoint = shapesUnderPoint.map (shapes)->
      shapes
        .map (shape)-> shapeIdToNodeMap[shape.id]
        .filter (node)-> node?
     */

    /*
    edgesUnderPoint = shapesUnderPoint.map (shapes)->
      shapes
        .map (shape)-> shapeIdToEdgeMap[shape.id]
        .filter (edge)-> edge?
     */

    /*
    nodesUnderPoint.onValue (nodes)->
       * console.log "nodesUnderPoint:"
       * console.log nodes
      nodes.forEach (node)->
        shape = nodeShapeMap[node.id]
        shape.graphics.clear().beginFill("blue").drawCircle(0, 0, 10)
      stageUpdate()
     */

    /*
    edgesUnderPoint.onValue (edges)->
       * console.log "edgesUnderPoint"
       * console.log edges
      edges.forEach (edge)->
        x1 = viewport.physicalToLogical(edge.x1)
        y1 = viewport.physicalToLogical(edge.y1)
        x2 = viewport.physicalToLogical(edge.x2)
        y2 = viewport.physicalToLogical(edge.y2)
    
        shape = edgeShapeMap[edge.id]
        shape.graphics.clear().setStrokeStyle(3).beginStroke("blue").moveTo(x1, y1).lineTo(x2, y2)
      stageUpdate()
     */
    windowSize.onValue(function(value) {
      stage.canvas.width = value.width;
      stage.canvas.height = value.height;
      return stageUpdate();
    });
    return $(document).asEventStream("keydown").onValue(function(e) {
      switch (e.keyCode) {
        case 38:
          console.log("up");
          return viewport.push(new Viewport({
            scale: 1.0 / 1000 * 30
          }));
        case 40:
          return console.log("down");
        case 37:
          return console.log("left");
        case 40:
          return console.log("right");
      }
    });
  });

}).call(this);
