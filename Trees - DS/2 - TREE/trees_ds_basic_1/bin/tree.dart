class TreeNode {
  final String _data;
  final List<TreeNode> _children;
  TreeNode({required String data})
      : _data = data,
        _children = [];

  void addChild(TreeNode node) => _children.add(node);
  String print(int level) {
    String ret;
    ret = '${' '.repeat(toRepeat: level)}$_data\n';
    for (var node in _children) {
      ret += node.print(level + 1);
    }

    return ret;
  }
}

extension ExtendedString on String {
  String repeat({required int toRepeat}) {
    String concatenation = '';
    for (var i = 0; i < toRepeat; i++) {
      concatenation += this;
    }
    return concatenation;
  }
}
