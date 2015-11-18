
require "json"

node_x = (ARGV.shift || "5").to_i
node_y = (ARGV.shift || "5").to_i
unit   = (ARGV.shift || "2540").to_i

nodes = []
node_y.times { |yi|
  node_x.times { |xi|
    nodes << {
      id: format("(%d,%d)", xi, yi),
      x: xi * unit,
      y: yi * unit,
    }
  }
}

edges = []
node_y.times { |yi|
  node_x.times.each_cons(2) { |xi1, xi2|
    edges << {
      id: format("(%d,%d)-(%d,%d)", xi1, yi, xi2, yi),
      a: format("(%d,%d)", xi1, yi),
      b: format("(%d,%d)", xi2, yi),
    }
  }
}

node_y.times.each_cons(2) { |yi1, yi2|
  node_x.times { |xi|
    edges << {
      id: format("(%d,%d)-(%d,%d)", xi, yi1, xi, yi2),
      a: format("(%d,%d)", xi, yi1),
      b: format("(%d,%d)", xi, yi2),
    }
  }
}

graph = {
  nodes: nodes,
  edges: edges,
}

puts(graph.to_json)
