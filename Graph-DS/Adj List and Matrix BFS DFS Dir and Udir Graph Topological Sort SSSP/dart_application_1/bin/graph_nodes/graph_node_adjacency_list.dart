class GraphNodeViaList {
  GraphNodeViaList({required String name, required int index})
      : _name = name,
        _index = index;
  bool isVisited = false;
  final String _name;
  final int _index;
  GraphNodeViaList? parent;
  List<GraphNodeViaList> neighbors = <GraphNodeViaList>[];
  String get name => _name;
  int get index => _index;
}
