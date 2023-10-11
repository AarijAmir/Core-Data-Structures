class BinaryTreeUsingArray<T> {
  List<T?>? list;
  int lastUsedIndex;
  BinaryTreeUsingArray(int size)
      : list = List.filled(size + 1, null, growable: false),
        lastUsedIndex = 0;

  bool get isFull => list!.length - 1 == lastUsedIndex;
  void insert(T value) {
    if (!isFull) {
      lastUsedIndex++;
      list![lastUsedIndex] = value;
      print('The Value $value has been inserted in Binary Tree');
    } else {
      print('The Binary Tree is Full');
    }
  }

  void preOrderTraversal(int index) {
    if (index > lastUsedIndex) {
      return;
    }
    print(list![index]);
    preOrderTraversal(index * 2);
    preOrderTraversal(index * 2 + 1);
  }

  void inOrderTraversal(int index) {
    if (index > lastUsedIndex) {
      return;
    }
    inOrderTraversal(index * 2);
    print(list![index]);
    inOrderTraversal(index * 2 + 1);
  }

  void postOrderTraversal(int index) {
    if (index > lastUsedIndex) {
      return;
    }
    postOrderTraversal(index * 2);
    postOrderTraversal(index * 2 + 1);
    print(list![index]);
  }

  void levelOrderTraversal() {
    for (var i = 1; i <= lastUsedIndex; i++) {
      print(list![i]);
    }
  }

  int? search(T value) {
    for (var i = 1; i <= lastUsedIndex; i++) {
      if (value == list![i]) {
        print('Value Found At Location = $i');
        return i;
      }
    }
    print('Value = $value does not exists in the Binary Tree');
    return null;
  }

  void delete(T value) {
    int? location = search(value);
    if (location == null) {
      return;
    }
    list![location] = list![lastUsedIndex];
    lastUsedIndex--;
    print('The node has been deleted successfully...');
  }

  void treeDeletion() {
    list = null;
  }
}
