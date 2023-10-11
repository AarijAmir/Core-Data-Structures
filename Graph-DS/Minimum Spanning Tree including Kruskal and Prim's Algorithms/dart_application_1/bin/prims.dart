import 'core-data-structure/priority_queue/priority_queue.dart';
import 'weighted_node.dart';

class Prims {
  List<WeightedNode> nodeList;
  Prims(this.nodeList);
  void prims(WeightedNode node) {
    for (var i = 0; i < nodeList.length; i++) {
      nodeList[i].distance = (double.maxFinite ~/ 10).toInt();
    }
    node.distance = 0;
    PriorityQueue<WeightedNode> queue = PriorityQueue<WeightedNode>();
    queue.addAll(nodeList);
    while (!queue.isEmpty()) {
      WeightedNode presentNode = queue.dequeue()!;
      for (var neighbor in presentNode.neighbors) {
        if (queue.contains(neighbor)) {
          //If vertex is not processed, only then enter in if-else
          //If known weight of this �adjacent vertex� is more than current edge,
          //then update �adjacent vertex�s� distance and parent
          if (neighbor.distance > presentNode.weightMap[neighbor]!) {
            neighbor.distance = presentNode.weightMap[neighbor]!;
            neighbor.parent = presentNode;
            queue.remove(neighbor);
            queue.enqueue(neighbor);
          }
        }
      }
    }
    int cost = 0;
    // print table of node with minimum distance and shortest path from source
    for (WeightedNode nodeToCheck in nodeList) {
      print(
          "Node ${nodeToCheck.name}, key: ${nodeToCheck.distance}, Parent: ${nodeToCheck.parent?.name}");
      cost = cost + nodeToCheck.distance;
    } //end of for loop

    print("\nTotal cost of MST: $cost");
  }

  // add a weighted undirected edge between two nodes

  void addWeightedUndirectedEdge(
      {required int firstIndex,
      required int secondIndex,
      required int weight}) {
    WeightedNode first = nodeList[firstIndex];
    WeightedNode second = nodeList[secondIndex];
    first.neighbors.add(second);
    second.neighbors.add(first);
    first.weightMap.addAll({second: weight});
    second.weightMap.addAll({first: weight});
  }
}
