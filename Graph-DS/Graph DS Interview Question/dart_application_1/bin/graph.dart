import 'graph_node.dart';
import 'other_data_structures/queue/queue_with_linked_list.dart';

class Graph {
  List<GraphNode> nodeList;
  Graph(this.nodeList);
  void addDirectedEdge(int i, int j) {
    GraphNode first = nodeList[i];
    GraphNode second = nodeList[j];
    first.neighbors.add(second);
  }

  // method for checking road/route between given nodes over here.
  bool search(GraphNode start, GraphNode end) {
    QueueWithLinkedList<GraphNode> queue = QueueWithLinkedList<GraphNode>();
    for (var node in nodeList) {
      node.state = GraphState.unvisited;
    }
    start.state = GraphState.visiting;
    queue.enqueue(start);
    GraphNode currentNode;
    while (!queue.isEmpty()) {
      currentNode = queue.deQueue()!;
      for (var v in currentNode.neighbors) {
        if (v.state == GraphState.unvisited) {
          if (v == end) {
            return true;
          } else {
            v.state = GraphState.visiting;
            queue.enqueue(v);
          }
        }
        currentNode.state = GraphState.visited;
      }
    }
    return false;
  }
}
