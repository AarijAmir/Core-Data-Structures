class GraphNode {
  String name;
  int index;
  bool isVisited = false;
  GraphNode? parent;
  GraphState? state;
  List<GraphNode> neighbors = [];
  GraphNode({required this.name, required this.index});
  @override
  String toString() {
    // TODO: implement toString
    return 'Name = $name, Index = $index';
  }
}

enum GraphState { unvisited, visited, visiting }
