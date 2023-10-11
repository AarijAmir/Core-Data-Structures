import 'dart:core';

import 'disjoint_set.dart';

class WeightedNode implements Comparable<WeightedNode> {
  final String name;
  final List<WeightedNode> neighbors;
  final Map<WeightedNode, int> weightMap;
  bool isVisited;
  WeightedNode? parent;
  int distance;
  int index;
  DisjointSet? set;

  WeightedNode(this.name, this.index)
      : neighbors = [],
        weightMap = {},
        isVisited = false,
        distance = double.maxFinite.toInt();

  @override
  String toString() {
    return name;
  }

  @override
  int compareTo(WeightedNode other) {
    // TODO: implement compareTo
    return distance - other.distance;
  }
}
