import 'weighted_graph.dart';
import 'weighted_node.dart';


void main() {
  // List<WeightedNode> nodeList = [
  //   WeightedNode('A', 0),
  //   WeightedNode('B', 1),
  //   WeightedNode('C', 2),
  //   WeightedNode('D', 3),
  //   WeightedNode('E', 4),
  //   WeightedNode('F', 5),
  //   WeightedNode('G', 6)
  // ];
  // WeightedGraph weightedGraph = WeightedGraph(nodeList);
  // weightedGraph.addWeightedEdge(0, 1, 2);
  // weightedGraph.addWeightedEdge(0, 2, 5);
  // weightedGraph.addWeightedEdge(1, 2, 6);
  // weightedGraph.addWeightedEdge(1, 3, 1);
  // weightedGraph.addWeightedEdge(1, 4, 3);
  // weightedGraph.addWeightedEdge(2, 5, 8);
  // weightedGraph.addWeightedEdge(3, 4, 4);
  // weightedGraph.addWeightedEdge(4, 6, 9);
  // weightedGraph.addWeightedEdge(5, 6, 7);

  // weightedGraph.dijkstra(nodeList[0]);
  // weightedGraph.bellmanFord(nodeList[0]);

  List<WeightedNode> nodeList = [
    WeightedNode('A', 0),
    WeightedNode('B', 1),
    WeightedNode('C', 2),
    WeightedNode('D', 3),
  ];
  WeightedGraph newGraph = WeightedGraph(nodeList);
  newGraph.addWeightedEdge(0, 3, 1);
  newGraph.addWeightedEdge(0, 1, 8);
  newGraph.addWeightedEdge(1, 2, 1);
  newGraph.addWeightedEdge(2, 0, 4);
  newGraph.addWeightedEdge(3, 1, 2);
  newGraph.addWeightedEdge(0, 3, 1);
  newGraph.addWeightedEdge(3, 2, 9);
  WeightedGraph weightedGraph = WeightedGraph(nodeList);
  weightedGraph.floydWarshall();
}
