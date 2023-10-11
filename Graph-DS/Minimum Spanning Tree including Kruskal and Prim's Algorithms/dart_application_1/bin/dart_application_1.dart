import 'prims.dart';
import 'weighted_node.dart';

void main(List<String> arguments) {
  // List<WeightedNode> nodeList = [];
  // nodeList.add(WeightedNode('A', 0));
  // nodeList.add(WeightedNode('B', 1));
  // nodeList.add(WeightedNode('C', 2));
  // nodeList.add(WeightedNode('D', 3));
  // DisjointSet.makeSet(nodeList);
  // WeightedNode firstNode = nodeList[0];
  // WeightedNode secondNode = nodeList[1];
  // DisjointSet output = DisjointSet.findSet(secondNode);
  // output.printAllNodesofThisSet();
  // DisjointSet.union(firstNode, secondNode);
  // output = DisjointSet.findSet(secondNode);
  // output.printAllNodesofThisSet();
  // Kruskal
  // List<WeightedNode> nodeList = [];
  // nodeList.add(WeightedNode('A', 0));
  // nodeList.add(WeightedNode('B', 1));
  // nodeList.add(WeightedNode('C', 2));
  // nodeList.add(WeightedNode('D', 3));
  // nodeList.add(WeightedNode('E', 4));

  // Kruskal graph = Kruskal(nodeList);
  // graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 1, weight: 5);
  // graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 2, weight: 13);
  // graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 4, weight: 15);
  // graph.addWeightedUndirectedEdge(firstIndex: 1, secondIndex: 2, weight: 10);
  // graph.addWeightedUndirectedEdge(firstIndex: 1, secondIndex: 3, weight: 8);
  // graph.addWeightedUndirectedEdge(firstIndex: 2, secondIndex: 3, weight: 6);
  // graph.addWeightedUndirectedEdge(firstIndex: 2, secondIndex: 4, weight: 20);
  // print('Running Kruskal Algorithm on the Graph: ');
  // graph.kruskal();

  List<WeightedNode> nodeList = [];
  nodeList.add(WeightedNode('A', 0));
  nodeList.add(WeightedNode('B', 1));
  nodeList.add(WeightedNode('C', 2));
  nodeList.add(WeightedNode('D', 3));
  nodeList.add(WeightedNode('E', 4));

  Prims graph = Prims(nodeList);
  graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 1, weight: 5);
  graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 2, weight: 13);
  graph.addWeightedUndirectedEdge(firstIndex: 0, secondIndex: 4, weight: 15);
  graph.addWeightedUndirectedEdge(firstIndex: 1, secondIndex: 2, weight: 10);
  graph.addWeightedUndirectedEdge(firstIndex: 1, secondIndex: 3, weight: 8);
  graph.addWeightedUndirectedEdge(firstIndex: 2, secondIndex: 3, weight: 6);
  graph.addWeightedUndirectedEdge(firstIndex: 2, secondIndex: 4, weight: 20);
  print('Running Prims Algorithm on the Graph: ');
  graph.prims(nodeList[4]);
}
