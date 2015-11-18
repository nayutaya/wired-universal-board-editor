// Generated by CoffeeScript 1.9.3
(function() {
  var Board, CursorShape, EdgeShape, NodeShape, Viewport, board_6x4, edgeWidth, nodeRadius, viewport, windowSize, windowSizeAtReady, windowSizeAtResize;

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

  edgeWidth = new Bacon.Bus();

  viewport = new Bacon.Bus();

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
      this.offsetX = options != null ? options.offsetX : void 0;
      this.offsetY = options != null ? options.offsetY : void 0;
    }

    Viewport.prototype.physicalXToLogicalX = function(value) {
      return (value * this.scale) + this.offsetX;
    };

    Viewport.prototype.physicalYToLogicalY = function(value) {
      return (value * this.scale) + this.offsetY;
    };

    Viewport.prototype.logicalXToPhysicalX = function(value) {
      return (value - this.offsetX) / this.scale;
    };

    Viewport.prototype.logicalYToPhysicalY = function(value) {
      return (value - this.offsetY) / this.scale;
    };

    return Viewport;

  })();

  CursorShape = (function() {
    function CursorShape(position, stageUpdate) {
      var self;
      this.shape = new createjs.Shape();
      this.shape.graphics.beginStroke("green").moveTo(0, -5).lineTo(0, +5).moveTo(-5, 0).lineTo(+5, 0);
      self = this;
      position.onValue(function(position) {
        self.shape.x = position.x;
        self.shape.y = position.y;
        return stageUpdate();
      });
    }

    return CursorShape;

  })();

  NodeShape = (function() {
    function NodeShape(node1, viewport, nodeRadius, stageUpdate) {
      var self;
      this.node = node1;
      this.shape = new createjs.Shape();
      this.color = new Bacon.Bus();
      self = this;
      Bacon.combineTemplate({
        color: this.color,
        nodeRadius: nodeRadius
      }).onValue(function(value) {
        var color;
        color = value.color;
        nodeRadius = value.nodeRadius;
        self.shape.graphics.clear().beginFill(color).drawCircle(0, 0, nodeRadius);
        return stageUpdate();
      });
      viewport.onValue(function(viewport) {
        self.shape.x = viewport.physicalXToLogicalX(self.node.x);
        self.shape.y = viewport.physicalYToLogicalY(self.node.y);
        return stageUpdate();
      });
      this.setColor("DeepSkyBlue");
    }

    NodeShape.prototype.setColor = function(color) {
      return this.color.push(color);
    };

    return NodeShape;

  })();

  EdgeShape = (function() {
    function EdgeShape(edge1, viewport, edgeWidth, stageUpdate) {
      var self;
      this.edge = edge1;
      this.shape = new createjs.Shape();
      this.color = new Bacon.Bus();
      self = this;
      Bacon.combineTemplate({
        viewport: viewport,
        edgeWidth: edgeWidth,
        color: this.color
      }).onValue(function(value) {
        var color, x1, x2, y1, y2;
        viewport = value.viewport;
        edgeWidth = value.edgeWidth;
        color = value.color;
        x1 = viewport.physicalXToLogicalX(self.edge.x1);
        y1 = viewport.physicalYToLogicalY(self.edge.y1);
        x2 = viewport.physicalXToLogicalX(self.edge.x2);
        y2 = viewport.physicalYToLogicalY(self.edge.y2);
        self.shape.graphics.clear().setStrokeStyle(edgeWidth).beginStroke(color).moveTo(x1, y1).lineTo(x2, y2);
        return stageUpdate();
      });
      this.setColor("red");
    }

    EdgeShape.prototype.setColor = function(color) {
      return this.color.push(color);
    };

    return EdgeShape;

  })();

  $(document).ready(function() {
    var board, cursorPosition, cursorShape, edgeShapesUnderPoint, moveTable, nodeShapesUnderPoint, offsetStream, shapeIdToEdgeShapeMap, shapeIdToNodeShapeMap, shapesUnderPoint, stage, stageUpdate;
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
    shapeIdToNodeShapeMap = {};
    board.nodes.forEach(function(node) {
      var nodeShape;
      nodeShape = new NodeShape(node, viewport, nodeRadius, stageUpdate);
      stage.addChild(nodeShape.shape);
      return shapeIdToNodeShapeMap[nodeShape.shape.id] = nodeShape;
    });
    shapeIdToEdgeShapeMap = {};
    board.edges.forEach(function(edge) {
      var edgeShape;
      edgeShape = new EdgeShape(edge, viewport, edgeWidth, stageUpdate);
      stage.addChild(edgeShape.shape);
      return shapeIdToEdgeShapeMap[edgeShape.shape.id] = edgeShape;
    });
    nodeRadius.push(10);
    edgeWidth.push(3);
    viewport.push(new Viewport({
      scale: 1.0 / 1000 * 20,
      offsetX: 0,
      offsetY: 0
    }));
    cursorPosition = $("#canvas1").asEventStream("mousemove").map(function(e) {
      return {
        x: e.offsetX,
        y: e.offsetY
      };
    });
    cursorShape = new CursorShape(cursorPosition, stageUpdate);
    stage.addChild(cursorShape.shape);
    stageUpdate();
    shapesUnderPoint = cursorPosition.map(function(value) {
      return stage.getObjectsUnderPoint(value.x, value.y);
    });
    nodeShapesUnderPoint = shapesUnderPoint.map(function(shapes) {
      return shapes.map(function(shape) {
        return shapeIdToNodeShapeMap[shape.id];
      }).filter(function(nodeShape) {
        return nodeShape != null;
      });
    });
    edgeShapesUnderPoint = shapesUnderPoint.map(function(shapes) {
      return shapes.map(function(shape) {
        return shapeIdToEdgeShapeMap[shape.id];
      }).filter(function(edgeShape) {
        return edgeShape != null;
      });
    });
    nodeShapesUnderPoint.onValue(function(nodeShapes) {
      return nodeShapes.forEach(function(nodeShape) {
        return nodeShape.setColor("blue");
      });
    });
    edgeShapesUnderPoint.onValue(function(edgeShapes) {
      return edgeShapes.forEach(function(edgeShape) {
        return edgeShape.setColor("blue");
      });
    });
    windowSize.onValue(function(value) {
      stage.canvas.width = value.width;
      stage.canvas.height = value.height;
      return stageUpdate();
    });
    moveTable = {
      38: {
        x: 0,
        y: +10
      },
      40: {
        x: 0,
        y: -10
      },
      37: {
        x: +10,
        y: 0
      },
      39: {
        x: -10,
        y: 0
      }
    };
    offsetStream = $(document).asEventStream("keydown").map(function(e) {
      var ref;
      return (ref = moveTable[e.keyCode]) != null ? ref : {
        x: 0,
        y: 0
      };
    }).scan({
      x: 0,
      y: 0
    }, function(a, b) {
      return {
        x: a.x + b.x,
        y: a.y + b.y
      };
    });
    offsetStream.onValue(function(e) {
      return viewport.push(new Viewport({
        scale: 1.0 / 1000 * 20,
        offsetX: e.x,
        offsetY: e.y
      }));
    });
    return $(document).asEventStream("keydown").onValue(function(e) {
      switch (e.keyCode) {
        case 38:
          return console.log("up");
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
