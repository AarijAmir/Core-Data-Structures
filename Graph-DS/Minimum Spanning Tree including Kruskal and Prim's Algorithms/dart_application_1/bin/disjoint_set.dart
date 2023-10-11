import 'weighted_node.dart';

class DisjointSet {
  final List<WeightedNode> _nodeList = [];
  static void makeSet(List<WeightedNode> nodeList) {
    for (var node in nodeList) {
      DisjointSet set = DisjointSet();
      set._nodeList.add(node);
      node.set = set;
    }
  }

  static DisjointSet findSet(WeightedNode node) {
    return node.set!;
  }

  static DisjointSet? union(WeightedNode nodeOne, WeightedNode nodeTwo) {
    if (nodeOne.set == nodeTwo.set) {
      return null;
    } else {
      DisjointSet setOne = nodeOne.set!;
      DisjointSet setTwo = nodeTwo.set!;

      if (setOne._nodeList.length > setTwo._nodeList.length) {
        List<WeightedNode> nodesSetTwo = setTwo._nodeList;
        for (WeightedNode node in nodesSetTwo) {
          node.set = setOne;
          setOne._nodeList.add(node);
        }
        return setOne;
      } else {
        List<WeightedNode> nodesSetOne = setOne._nodeList;
        for (WeightedNode node in nodesSetOne) {
          node.set = setTwo;
          setTwo._nodeList.add(node);
        }
        return setTwo;
      }
    }
  }

  void printAllNodesofThisSet() {
    print("Printing all nodes of the set: ");
    for (WeightedNode node in _nodeList) {
      print(node);
    }
  }
}
