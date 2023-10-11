void main(List<String> arguments) {
  dynamic i;
  print(i.runtimeType);
  i = 1;
  print(i.runtimeType);
  // AVLTree avlTree = AVLTree();
  // avlTree.insert(70);
  // avlTree.insert(30);
  // avlTree.insert(100);
  // avlTree.insert(20);
  // avlTree.insert(50);
  // avlTree.insert(90);
  // avlTree.insert(110);
  // avlTree.insert(105);
  // avlTree.levelOrderTraversal();
  // print('-------------');
  // avlTree.deleteNode(70);
  // avlTree.levelOrderTraversal();
}

void checkExceptions(int value) {
  try {
    if (value < 5) {
      print('Before Throwing');
      throw Exception('Very Bad Programming Idea');
    }
  } catch (e) {
    print('Exception Caught $e');
    rethrow;
  } finally {
    print('Very Bad..');
  }
}
