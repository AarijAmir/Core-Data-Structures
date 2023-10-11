class TrieNode {
  Map<String, TrieNode> children;
  bool endOfString;
  TrieNode()
      : children = {},
        endOfString = false;
}
