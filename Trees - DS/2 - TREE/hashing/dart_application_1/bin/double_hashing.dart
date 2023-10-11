class DoubleHashing {
  List<String?> hashTable;
  int usedCellNumber;
  DoubleHashing(int size)
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

  int addAllDigitsTogether({required int sum}) {
    int val = 0;
    while (sum > 0) {
      val = sum % 10;
      sum = sum ~/ 10;
    }
    return val;
  }

  int secondHashFunction({required String x, required int M}) {
    int sum = 0;
    for (var i = 0; i < x.length; i++) {
      sum += x.codeUnitAt(i);
    }
    while (sum > hashTable.length) {
      sum = addAllDigitsTogether(sum: sum);
    }
    return sum % M;
  }

  void insertInHashTable({required String word}) {
    double loadFactor = getLoadFactor();
    if (loadFactor > 0.75) {
      rehashKeys(word: word);
    } else {
      // Calling First Hash Function
      int x = modASCIIHashFunction(word: word, M: hashTable.length);
      // Calling Second Hash Function
      int y = secondHashFunction(x: word, M: hashTable.length);
      for (var i = 0; i < hashTable.length; i++) {
        int newIndex = (x + i * y) % hashTable.length;
        if (hashTable[newIndex] == null) {
          hashTable[newIndex] = word;
          print(
              'Word = $word has been inserted successfully at Location = $newIndex');
          break;
        } else {
          print('$newIndex is already occupied. Trying next one.');
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
