import 'disjoint_set.dart';
import 'undirected_edge.dart';
import 'weighted_node.dart';

class Kruskal {
  List<WeightedNode> nodeList;
  List<UndirectedEdge> edgeList = [];
  Kruskal(this.nodeList);
  void addWeightedUndirectedEdge(
      {required int firstIndex,
      required int secondIndex,
      required int weight}) {
    UndirectedEdge edge = UndirectedEdge(
        first: nodeList[firstIndex],
        second: nodeList[secondIndex],
        weight: weight);
    WeightedNode first = edge.first;
    WeightedNode second = edge.second;
    first.neighbors.add(second);
    second.neighbors.add(first);
    first.weightMap.addAll({second: weight});
    second.weightMap.addAll({first: weight});
    edgeList.add(edge);
  }

  void kruskal() {
    DisjointSet.makeSet(nodeList);
    edgeList.sort();
    print(edgeList);
    int cost = 0;
    for (UndirectedEdge edge in edgeList) {
      WeightedNode first = edge.first;
      WeightedNode second = edge.second;
      if (!(DisjointSet.findSet(first) == DisjointSet.findSet(second))) {
        DisjointSet.union(first, second);
        cost += edge.weight;
        print('Taken = $edge');
      }
    }
    print('Total cost of minimum spanning tree is: $cost');
  }
}
