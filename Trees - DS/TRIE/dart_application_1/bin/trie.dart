import 'trie_node.dart';

class Trie {
  TrieNode root;
  Trie() : root = TrieNode() {
    print('TRIE has been created...');
  }
  void insert(String word) {
    TrieNode currentNode = root;
    for (var i = 0; i < word.length; i++) {
      String ch = word[i];
      TrieNode? node = currentNode.children[ch];
      if (node == null) {
        node = TrieNode();
        currentNode.children.addAll({ch: node});
      }
      currentNode = node;
    }
    currentNode.endOfString = true;
    print('Word = $word has been inserted in TRIE...');
  }

  bool deleteWord(TrieNode? parentNode, String word, int index) {
    String ch = word[index];
    TrieNode? currentNode = parentNode?.children[ch];
    bool canThisNodeBeDeleted;
    if (currentNode != null && currentNode.children.length > 1) {
      deleteWord(currentNode, word, index + 1);
    }
    if (index == word.length - 1) {
      if (currentNode != null && currentNode.children.isNotEmpty) {
        currentNode.endOfString = false;
        return false;
      } else {
        parentNode?.children.remove(ch);
        print('Node has been deleted successfully...');
        return true;
      }
    }
    if (currentNode != null && currentNode.endOfString) {
      deleteWord(currentNode, word, index + 1);
      return false;
    }
    canThisNodeBeDeleted = deleteWord(currentNode, word, index + 1);
    if (canThisNodeBeDeleted) {
      parentNode?.children.remove(ch);
      print('Node has been deleted successfully...');
      return true;
    } else {
      return false;
    }
  }

  bool search(String word) {
    TrieNode currentNode = root;
    for (var i = 0; i < word.length; i++) {
      String ch = word[i];
      TrieNode? node = currentNode.children[ch];
      if (node == null) {
        print('Word = $word does not exists in the TRIE');
        return false;
      }
      currentNode = node;
    }
    if (currentNode.endOfString) {
      print('Word = $word has been found in the TRIE');
      return true;
    } else {
      print(
          'Word = $word does not exist in the TRIE but is a Prefix of another String');
      return false;
    }
  }

  void delete(String word) {
    if (search(word)) {
      deleteWord(root, word, 0);
    }
  }
}






// import 'trie_node.dart';

// class Trie {
//   TrieNode root;
//   Trie() : root = TrieNode();
//   void insert(String word) {
//     TrieNode currentNode = root;
//     for (var i = 0; i < word.length; i++) {
//       String ch = word[i];
//       TrieNode? node = currentNode.children[ch];
//       if (node == null) {
//         node = TrieNode();
//         currentNode.children.addAll({ch: node});
//       }
//       currentNode = node;
//     }
//     currentNode.endOfString = true;
//     print('Word = $word has been inserted in the TRIE successfully...');
//   }

//   bool search(String word) {
//     TrieNode currentNode = root;
//     for (var i = 0; i < word.length; i++) {
//       String ch = word[i];
//       TrieNode? node = currentNode.children[ch];
//       if (node == null) {
//         print('Word = $word does not exists in the TRIE');
//         return false;
//       }
//       currentNode = node;
//     }
//     if (currentNode.endOfString == true) {
//       print('Word = $word found in the TRIE');
//       return true;
//     } else {
//       print(
//           'Word = $word does not exists in the TRIE but is a prefix of another String');
//       return false;
//     }
    
//   }
// }
