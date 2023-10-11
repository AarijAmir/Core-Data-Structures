import 'core-data-structure/priority_queue/priority_queue.dart';
import 'weighted_node.dart';

class WeightedGraph {
  final List<WeightedNode> _nodeList;

  WeightedGraph(List<WeightedNode> nodeList) : _nodeList = nodeList;

  void dijkstra(WeightedNode node) {
    PriorityQueue<WeightedNode> queue = PriorityQueue<WeightedNode>();
    node.distance = 0;
    queue.addAll(_nodeList);
    while (!queue.isEmpty()) {
      WeightedNode currentNode = queue.dequeue()!;
      for (WeightedNode neighbor in currentNode.neighbors) {
        if (queue.contains(neighbor)) {
          int newDistance =
              currentNode.distance + currentNode.weightMap[neighbor]!;
          if (newDistance < neighbor.distance) {
            neighbor.distance = newDistance;
            neighbor.parent = currentNode;
          }
        }
      }
    }

    for (WeightedNode nodeToCheck in _nodeList) {
      print("Node $nodeToCheck, distance: ${nodeToCheck.distance}, Path: ");
      StringBuffer buffer = StringBuffer();
      pathPrint(nodeToCheck, buffer);
      print(buffer);
    }
  }

  void pathPrint(WeightedNode node, StringBuffer string) {
    if (node.parent != null) {
      pathPrint(node.parent!, string);
    }
    string.write("${node.name} ");
  }

  void addWeightedEdge(int i, int j, int d) {
    print('$i, $j, $d');
    WeightedNode first = _nodeList[i];
    WeightedNode second = _nodeList[j];
    first.neighbors.add(second);
    first.weightMap[second] = d;
  }

  // Bellman Ford Algorithm
  void bellmanFord(WeightedNode sourceNode) {
    sourceNode.distance = 0;
    for (int i = 0; i < _nodeList.length - 1; i++) {
      for (WeightedNode currentNode in _nodeList) {
        for (WeightedNode neighbor in currentNode.neighbors) {
          if (neighbor.distance >
              currentNode.distance + currentNode.weightMap[neighbor]!) {
            neighbor.distance =
                currentNode.distance + currentNode.weightMap[neighbor]!;
            neighbor.parent = currentNode;
          }
        }
      }
    }
    print("Checking for Negative Cycle..");
    for (WeightedNode currentNode in _nodeList) {
      for (WeightedNode neighbor in currentNode.neighbors) {
        if (neighbor.distance >
            currentNode.distance + currentNode.weightMap[neighbor]!) {
          print("Negative cycle found: \n");
          print("Vertex name: ${neighbor.name}");
          print("Old cost: ${neighbor.distance}");
          int newDistance =
              currentNode.distance + currentNode.weightMap[neighbor]!;
          print("New cost: $newDistance");
          return;
        }
      }
    }
    print("Negative Cycle not found");

    for (WeightedNode nodeToCheck in _nodeList) {
      print("Node $nodeToCheck, distance: ${nodeToCheck.distance}, Path: ");
      StringBuffer buffer = StringBuffer();
      pathPrint(nodeToCheck, buffer);
      print(buffer);
    }
  }

  void floydWarshall() {
    int size = _nodeList.length;
    List<List<int>> V = List<List<int>>.generate(
      size,
      (_) => List<int>.filled(size, 0),
    );
    // Initializing Distance table from adjacency list
    for (int i = 0; i < size; i++) {
      WeightedNode first = _nodeList[i];
      for (int j = 0; j < size; j++) {
        WeightedNode second = _nodeList[j];
        if (i == j) {
          V[i][j] = 0;
        } else if (first.weightMap.containsKey(second)) {
          //we have direct edge between i & j
          V[i][j] = first.weightMap[second]!;
        } else {
          //no direct edge between i & j, so mark it as infinity [divided by 10 to avoid arithmetic overflow]
          V[i][j] = (double.maxFinite).toInt() ~/ 10;
        }
      }
    } //end of loop
    // Floyd Warshall's Algorithm
    for (int k = 0; k < size; k++) {
      for (int i = 0; i <  size; i++) {
        for (int j = 0; j < size; j++) {
          if (V[i][j] > V[i][k] + V[k][j]) {
            // if update possible, then update path
            V[i][j] = V[i][k] + V[k][j]; // this will keep a track on path
          }
        }
      }
    } //end of loop
    for (int i = 0; i < size; i++) {
      StringBuffer buffer = StringBuffer();
      print("Printing distance list for node ${_nodeList[i]}: ");
      for (int j = 0; j < size; j++) {
        buffer.write("${V[i][j]} ");
      }
      print(buffer);
    }
  }
}
