import 'binary_tree_using_array.dart';

void main(List<String> args) {
  // using array
  BinaryTreeUsingArray<String> binaryTreeUsingArray =
      BinaryTreeUsingArray<String>(9);
  binaryTreeUsingArray.insert('N1');
  binaryTreeUsingArray.insert('N2');
  binaryTreeUsingArray.insert('N3');
  binaryTreeUsingArray.insert('N4');
  binaryTreeUsingArray.insert('N5');
  binaryTreeUsingArray.insert('N6');
  binaryTreeUsingArray.insert('N7');
  binaryTreeUsingArray.insert('N8');
  binaryTreeUsingArray.insert('N9');
  binaryTreeUsingArray.levelOrderTraversal();
  binaryTreeUsingArray.search('N9');
  binaryTreeUsingArray.delete('N7');
  binaryTreeUsingArray.delete('N3');
  binaryTreeUsingArray.levelOrderTraversal();

  // using linked list
  // BinaryTreeLinkedList<String> binaryTreeLinkedList =
  //     BinaryTreeLinkedList<String>();
  // binaryTreeLinkedList.insert('N1');
  // binaryTreeLinkedList.insert('N2');
  // binaryTreeLinkedList.insert('N3');
  // binaryTreeLinkedList.insert('N4');
  // binaryTreeLinkedList.insert('N5');
  // binaryTreeLinkedList.insert('N6');
  // binaryTreeLinkedList.levelOrderTraversal();
  // binaryTreeLinkedList.deleteNode('N3');
  // binaryTreeLinkedList.levelOrderTraversal();

  // Insert in tree when we don't have insert().
  // BinaryNode<String> N1 = BinaryNode<String>();
  // N1.value = 'N1';
  // BinaryNode<String> N2 = BinaryNode<String>();
  // N2.value = 'N2';
  // BinaryNode<String> N3 = BinaryNode<String>();
  // N3.value = 'N3';
  // BinaryNode<String> N4 = BinaryNode<String>();
  // N4.value = 'N4';
  // BinaryNode<String> N5 = BinaryNode<String>();
  // N5.value = 'N5';
  // BinaryNode<String> N6 = BinaryNode<String>();
  // N6.value = 'N6';
  // BinaryNode<String> N7 = BinaryNode<String>();
  // N7.value = 'N7';
  // BinaryNode<String> N8 = BinaryNode<String>();
  // N8.value = 'N8';
  // BinaryNode<String> N9 = BinaryNode<String>();
  // N9.value = 'N9';
  // N1.left = N2;
  // N1.right = N3;
  // N2.left = N4;
  // N2.right = N5;
  // N3.left = N6;
  // N3.right = N7;
  // N4.left = N8;
  // N4.right = N9;
  // BinaryTreeLinkedList binaryTreeLinkedList = BinaryTreeLinkedList();
  // binaryTreeLinkedList.root = N1;
  // // binaryTreeLinkedList.levelOrderTraversal();
  // binaryTreeLinkedList.search('N1');
  // BinaryTreeLinkedList().postOrderTraversal(N1);

  // QueueWithLinkedList<int> queueWithLinkedList = QueueWithLinkedList<int>();
  // queueWithLinkedList.enqueue(10);
  // queueWithLinkedList.enqueue(20);
  // queueWithLinkedList.enqueue(30);
  // queueWithLinkedList.enqueue(40);
  // queueWithLinkedList.enqueue(50);
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.isEmpty);
}
