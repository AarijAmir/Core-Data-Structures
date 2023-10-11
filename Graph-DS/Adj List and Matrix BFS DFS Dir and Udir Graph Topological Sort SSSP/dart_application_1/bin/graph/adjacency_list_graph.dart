import 'dart:collection';

import '../graph_nodes/graph_node_adjacency_list.dart';
import '../other_data_structures/stack/stack_with_linked_list.dart';

class GraphWithList {
  List<GraphNodeViaList> nodeList;

  GraphWithList(this.nodeList);

  // add Undirected Edge

  void addUndirectedEdge(int i, int j) {
    GraphNodeViaList first = nodeList[i];
    GraphNodeViaList second = nodeList[j];
    first.neighbors.add(second);
    second.neighbors.add(first);
  }
  // helper for BFS
  void bfsVisit(GraphNodeViaList node) {
    Queue<GraphNodeViaList> queue = Queue<GraphNodeViaList>();
    queue.add(node);
    while (queue.isNotEmpty) {
      GraphNodeViaList currentNode = queue.removeFirst();
      currentNode.isVisited = true;
      print("${currentNode.name} ");
      for (GraphNodeViaList neighbor in currentNode.neighbors) {
        if (!neighbor.isVisited) {
          queue.add(neighbor);
          neighbor.isVisited = true;
        }
      }
    }
  }
  // BFS
  void bfs() {
    for (GraphNodeViaList node in nodeList) {
      if (!node.isVisited) {
        bfsVisit(node);
      }
    }
  }
  // Helper For DFS
  void dfsVisit(GraphNodeViaList node) {
    StackWithLinkedList<GraphNodeViaList> stack =
        StackWithLinkedList<GraphNodeViaList>();
    stack.push(node);
    while (!stack.isEmpty()) {
      GraphNodeViaList currentNode = stack.pop()!;
      currentNode.isVisited = true;
      print("${currentNode.name} ");
      for (GraphNodeViaList neighbor in currentNode.neighbors) {
        if (!neighbor.isVisited) {
          stack.push(neighbor);
          neighbor.isVisited = true;
        }
      }
    }
  }
  // DFS
  void dfs() {
    for (GraphNodeViaList node in nodeList) {
      if (!node.isVisited) {
        dfsVisit(node);
      }
    }
  }
  // For Adding Direct Edge
  void addDirectedEdge(int i, int j) {
    GraphNodeViaList first = nodeList[i];
    GraphNodeViaList second = nodeList[j];
    first.neighbors.add(second);
  }
  // Helper For Topological Sort
  void topologicalVisit(
      GraphNodeViaList node, StackWithLinkedList<GraphNodeViaList> stack) {
    for (GraphNodeViaList neighbor in node.neighbors) {
      if (!neighbor.isVisited) {
        topologicalVisit(neighbor, stack);
      }
    }
    node.isVisited = true;
    stack.push(node);
  }
  // Topological Sort
  void topologicalSort() {
    StackWithLinkedList<GraphNodeViaList> stack =
        StackWithLinkedList<GraphNodeViaList>();
    for (GraphNodeViaList node in nodeList) {
      if (!node.isVisited) {
        topologicalVisit(node, stack);
      }
    }
    while (!stack.isEmpty()) {
      print("${stack.pop()!.name} ");
    }
  }
  // For Printing Path
  static void pathPrint(GraphNodeViaList node) {
    if (node.parent != null) {
      pathPrint(node.parent!);
    }
    print("${node.name} ");
  }
  // BFS For UnWeighted Edges. Single Source Shortest Path Problem.
  void bfsForSSSPP(GraphNodeViaList node) {
    Queue<GraphNodeViaList> queue = Queue<GraphNodeViaList>();
    queue.add(node);
    while (queue.isNotEmpty) {
      GraphNodeViaList currentNode = queue.removeFirst();
      currentNode.isVisited = true;
      print("Printing path for node ${currentNode.name}: ");
      pathPrint(currentNode);
      for (GraphNodeViaList neighbor in currentNode.neighbors) {
        if (!neighbor.isVisited) {
          queue.add(neighbor);
          neighbor.isVisited = true;
          neighbor.parent = currentNode;
        }
      }
    }
  }

  @override
  String toString() {
    StringBuffer s = StringBuffer();
    for (int i = 0; i < nodeList.length; i++) {
      s.write("${nodeList[i].name}: ");
      for (int j = 0; j < nodeList[i].neighbors.length; j++) {
        if (j == nodeList[i].neighbors.length - 1) {
          s.write(nodeList[i].neighbors[j].name);
        } else {
          s.write("${nodeList[i].neighbors[j].name} -> ");
        }
      }
      s.write("\n");
    }
    return s.toString();
  }
}
