class GraphNodeViaMatrix {
  GraphNodeViaMatrix({required String name, required int index})
      : _name = name,
        _index = index;
  final String _name;
  final int _index;
  GraphNodeViaMatrix? parent;
  bool isVisited = false;
  String get name => _name;
  int get index => _index;
  @override
  String toString() {
    // TODO: implement toString
    return 'Name: $name, Index: $index, isVisited: $isVisited';
  }
}
