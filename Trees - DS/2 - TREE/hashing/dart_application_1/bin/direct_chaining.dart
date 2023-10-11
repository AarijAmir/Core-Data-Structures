import 'circular_doubly_linked_list/circular_doubly_linked_list.dart';

class DirectChaining {
  List<CircularDoublyLinkedList<String?>?> hashTable;
  int maxChainSize = 5;
  DirectChaining(int size)
      : hashTable = List.filled(
          size,
          null,
          growable: false,
        );

  int modASCIIHashFunction({required String word, required int M}) {
    int sum = 0;

    for (var i = 0; i < word.length; i++) {
      sum += word.codeUnitAt(i);
    }
    return sum % M;
  }

  void insertHashTable({required String word}) {
    int newIndex = modASCIIHashFunction(word: word, M: hashTable.length);
    if (hashTable[newIndex] == null) {
      hashTable[newIndex] = CircularDoublyLinkedList<String>();
      hashTable[newIndex]!.insertNode(value: word, location: 0);
    } else {
      hashTable[newIndex]!
          .insertNode(value: word, location: hashTable[newIndex]!.size + 1);
    }
  }

  void displayHashTable() {
    if (hashTable.isEmpty) {
      print('Hash Table Does Not Exists');
    } else {
      print('-----Hash Table-----');
      for (var i = 0; i < hashTable.length; i++) {
        print('Index $i');
        if (hashTable[i] != null) {
          hashTable[i]!.traversalCricularDoublyLinkedList();
        }
      }
    }
  }

  bool searchHashTable({required String word}) {
    int newIndex = modASCIIHashFunction(word: word, M: hashTable.length);
    if (hashTable[newIndex] != null &&
        hashTable[newIndex]!.searchNode(nodeValue: word)) {
      print('Word = $word found in hash table at the location = $newIndex');
      return true;
    } else {
      print('Word = $word did not find in hash table');
      return false;
    }
  }

  void deleteKeyHashTable(String word) {
    int newIndex = modASCIIHashFunction(word: word, M: hashTable.length);
    if (searchHashTable(word: word)) {
      hashTable[newIndex]!.deleteNodeByValue(value: word);
    }
  }
}
