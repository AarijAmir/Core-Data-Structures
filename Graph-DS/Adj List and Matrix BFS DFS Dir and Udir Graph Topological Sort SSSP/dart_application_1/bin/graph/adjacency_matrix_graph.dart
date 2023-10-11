import '../graph_nodes/graph_node_adjacency_matrix.dart';
import '../other_data_structures/queue/queue_with_linked_list.dart';
import '../other_data_structures/stack/stack_with_linked_list.dart';

class Graph {
  List<GraphNodeViaMatrix> nodeList;
  List<List<int>> adjacencyMatrix;

  Graph(List<GraphNodeViaMatrix> nodeList)
      : nodeList = nodeList,
        adjacencyMatrix = List<List<int>>.generate(
          nodeList.length,
          (_) => List<int>.filled(nodeList.length, 0),
        );
  // add Undirected Edge

  void addUndirectedEdge(int i, int j) {
    adjacencyMatrix[i][j] = 1;
    adjacencyMatrix[j][i] = 1;
  }

  @override
  String toString() {
    StringBuffer s = StringBuffer();
    s.write('   ');
    for (int i = 0; i < nodeList.length; i++) {
      s.write('${nodeList[i].name} ');
    }
    s.write('\n');
    for (int i = 0; i < nodeList.length; i++) {
      s.write('${nodeList[i].name}: ');
      for (int j in adjacencyMatrix[i]) {
        s.write('$j ');
      }
      s.write('\n');
    }
    return s.toString();
  }

  // For getting Neighbors. In Matrix we don't have neighbors field in Node
  List<GraphNodeViaMatrix> getNeighbors(GraphNodeViaMatrix node) {
    List<GraphNodeViaMatrix> neighbors = [];
    int nodeIndex = node.index;
    for (int i = 0; i < adjacencyMatrix.length; i++) {
      if (adjacencyMatrix[nodeIndex][i] == 1) {
        neighbors.add(nodeList[i]);
      }
    }
    return neighbors;
  }
  // Helper For BFS

  void bfsVisit(GraphNodeViaMatrix node) {
    QueueWithLinkedList<GraphNodeViaMatrix> queue =
        QueueWithLinkedList<GraphNodeViaMatrix>();
    queue.enqueue(node);
    while (!queue.isEmpty()) {
      GraphNodeViaMatrix currentNode = queue.deQueue()!;
      currentNode.isVisited = true;
      print('${currentNode.name} ');
      List<GraphNodeViaMatrix> neighbors = getNeighbors(currentNode);
      for (GraphNodeViaMatrix neighbor in neighbors) {
        if (!neighbor.isVisited) {
          queue.enqueue(neighbor);
          neighbor.isVisited = true;
        }
      }
    }
  }

// BFS
  void bfs() {
    for (GraphNodeViaMatrix node in nodeList) {
      if (!node.isVisited) {
        bfsVisit(node);
      }
    }
  }

// Helper For DFS
  void dfsVisit(GraphNodeViaMatrix node) {
    StackWithLinkedList<GraphNodeViaMatrix> stack =
        StackWithLinkedList<GraphNodeViaMatrix>();
    stack.push(node);
    while (!stack.isEmpty()) {
      GraphNodeViaMatrix currentNode = stack.pop()!;
      currentNode.isVisited = true;
      print('${currentNode.name} ');
      List<GraphNodeViaMatrix> neighbors = getNeighbors(currentNode);
      for (GraphNodeViaMatrix neighbor in neighbors) {
        if (!neighbor.isVisited) {
          stack.push(neighbor);
          neighbor.isVisited = true;
        }
      }
    }
  }

// DFS
  void dfs() {
    for (GraphNodeViaMatrix node in nodeList) {
      if (!node.isVisited) {
        dfsVisit(node);
      }
    }
  }

  // For Adding Direct Edge
  void addDirectedEdge(int i, int j) {
    adjacencyMatrix[i][j] = 1;
  }

// Helper For Topological Sort
  void topologicalVisit(
      GraphNodeViaMatrix node, StackWithLinkedList<GraphNodeViaMatrix> stack) {
    List<GraphNodeViaMatrix> neighbors = getNeighbors(node);
    for (GraphNodeViaMatrix neighbor in neighbors) {
      if (!neighbor.isVisited) {
        topologicalVisit(neighbor, stack);
      }
    }
    node.isVisited = true;
    stack.push(node);
  }

// Topological Sort
  void topologicalSort() {
    StackWithLinkedList<GraphNodeViaMatrix> stack =
        StackWithLinkedList<GraphNodeViaMatrix>();
    for (GraphNodeViaMatrix node in nodeList) {
      if (!node.isVisited) {
        topologicalVisit(node, stack);
      }
    }

    while (!stack.isEmpty()) {
      print('${stack.pop()!.name} ');
    }
  }

// For Printing Path
  static void pathPrint(GraphNodeViaMatrix node) {
    if (node.parent != null) {
      pathPrint(node.parent!);
    }
    print('${node.name} ');
  }

  // BFS For UnWeighted Edges. Single Source Shortest Path Problem.
  void bfsForSSSPP(GraphNodeViaMatrix node) {
    QueueWithLinkedList<GraphNodeViaMatrix> queue =
        QueueWithLinkedList<GraphNodeViaMatrix>();
    queue.enqueue(node);
    while (!queue.isEmpty()) {
      GraphNodeViaMatrix currentNode = queue.deQueue()!;
      currentNode.isVisited = true;
      print('Printing path for node ${currentNode.name}: ');
      pathPrint(currentNode);

      List<GraphNodeViaMatrix> neighbors = getNeighbors(currentNode);
      for (GraphNodeViaMatrix neighbor in neighbors) {
        if (!neighbor.isVisited) {
          queue.enqueue(neighbor);
          neighbor.isVisited = true;
          neighbor.parent = currentNode;
        }
      }
    }
  }
}
