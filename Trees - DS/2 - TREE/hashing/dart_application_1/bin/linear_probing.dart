class LinearProbing {
  List<String?> hashTable;
  int usedCellNumber;
  LinearProbing(int size)
      : hashTable = List.filled(size, null, growable: false),
        usedCellNumber = 0;

  int modASCIIHashFunction({required String word, required int M}) {
    int sum = 0;
    for (var i = 0; i < word.length; i++) {
      sum += word.codeUnitAt(i);
    }
    return sum % M;
  }

  double getLoadFactor() => usedCellNumber * 1.0 / hashTable.length;

  // Rehash
  void rehashKeys({required String word}) {
    usedCellNumber = 0;
    List<String> data = <String>[];
    for (String? element in hashTable) {
      if (element != null) {
        data.add(element);
      }
    }
    data.add(word);
    print('Hash Table Length = ${hashTable.length}');
    hashTable =
        List<String?>.filled(hashTable.length * 2, null, growable: false);
    for (String element in data) {
      insertInHashTable(word: element);
    }
  }

  void insertInHashTable({required String word}) {
    double loadFactor = getLoadFactor();
    print('Load Factor = $loadFactor');
    if (loadFactor >= 0.75) {
      rehashKeys(word: word);
    } else {
      int index = modASCIIHashFunction(word: word, M: hashTable.length);
      for (var i = index; i < index + hashTable.length; i++) {
        int newIndex = i % hashTable.length;
        if (hashTable[newIndex] == null) {
          hashTable[newIndex] = word;
          print(
              'The word = $word successfully inserted at location = $newIndex');
          break;
        } else {
          print("$newIndex is already occupied. Trying next empty cell");
        }
      }
    }
    usedCellNumber++;
  }

  bool searchHashTable({required String word}) {
    int index = modASCIIHashFunction(word: word, M: hashTable.length);
    for (var i = index; i < index + hashTable.length; i++) {
      int newIndex = i % hashTable.length;
      if (hashTable[newIndex] != null && hashTable[newIndex] == word) {
        print('The Word = $word Found At Location =$newIndex');
        return true;
      }
    }
    print('Word = $word not found in Hash-Table');
    return false;
  }

  void deleteKeyHashTable({required String word}) {
    int index = modASCIIHashFunction(word: word, M: hashTable.length);
    for (var i = index; i < index + hashTable.length; i++) {
      int newIndex = i % hashTable.length;
      if (hashTable[newIndex] != null && hashTable[newIndex] == word) {
        hashTable[newIndex] = null;
        print('Value = $word has been deleted from Hash-Table');
        return;
      }
    }
    print('Value = $word not found in the Hash-Table');
  }

  void displayHashTable() {
    if (hashTable.isEmpty) {
      print('Hash Table does not exists');
    } else {
      print('----Hash Table----');
      for (var i = 0; i < hashTable.length; i++) {
        print('Index: $i, Key: ${hashTable[i]}');
      }
    }
  }
}
