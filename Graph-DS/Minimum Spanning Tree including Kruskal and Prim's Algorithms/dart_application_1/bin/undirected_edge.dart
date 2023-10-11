import 'weighted_node.dart';

class UndirectedEdge implements Comparable<UndirectedEdge> {
  WeightedNode first;
  WeightedNode second;
  int weight;
  UndirectedEdge(
      {required this.first, required this.second, required this.weight});
  @override
  String toString() {
    // TODO: implement toString
    return 'Edge ($first , $second), weight = $weight';
  }

  @override
  int compareTo(UndirectedEdge o2) {
    // TODO: implement compareTo
    return weight - o2.weight;
  }
}
