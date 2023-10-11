import 'binary_search_tree.dart';

void main(List<String> arguments) {
  BinarySearchTree binarySearchTree = BinarySearchTree();
  binarySearchTree.insert(50);
  binarySearchTree.insert(37);
  binarySearchTree.insert(82);
  binarySearchTree.insert(32);
  binarySearchTree.insert(52);
  binarySearchTree.deleteNode(50, binarySearchTree.root);
  // binarySearchTree.insert(80);
  // binarySearchTree.insert(92);
  // binarySearchTree.insert(30);
  // binarySearchTree.insert(34);
  // binarySearchTree.insert(39);

  // binarySearchTree.insert(41);

  // binarySearchTree.insert(78);

  // binarySearchTree.insert(28);

  // binarySearchTree.insert(100);

  binarySearchTree.levelOrderTraversal();

  // binarySearchTree.search(binarySearchTree.root, 50);
  // binarySearchTree.postOrderTraversal(binarySearchTree.root);
  // binarySearchTree.levelOrderTraversal();
}
