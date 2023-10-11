import 'dart:math' as math;

import 'binary_node.dart';
import 'single_linked_list/queue_with_linked_list.dart';

class AVLTree {
  BinaryNode? root;
  AVLTree() : root = null;
  void inOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    inOrderTraversal(node.left);
    print(node.value);
    inOrderTraversal(node.right);
  }

  void preOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    print(node.value);
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  void postOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print(node.value);
  }

  void levelOrderTraversal() {
    QueueWithLinkedList<BinaryNode> queueWithLinkedList =
        QueueWithLinkedList<BinaryNode>();
    queueWithLinkedList.enqueue(root!);
    while (!queueWithLinkedList.isEmpty) {
      BinaryNode poppedNode = queueWithLinkedList.deQueue()!;
      print(poppedNode.value);
      if (poppedNode.left != null) {
        queueWithLinkedList.enqueue(poppedNode.left!);
      }
      if (poppedNode.right != null) {
        queueWithLinkedList.enqueue(poppedNode.right!);
      }
    }
  }

  BinaryNode? search(int value, BinaryNode? binaryNode) {
    if (binaryNode == null) {
      print('Node not found...');
      return null;
    } else if (binaryNode.value == value) {
      print('Node found in AVL-Tree');
      return binaryNode;
    } else if (binaryNode.value! > value) {
      return search(value, binaryNode.left);
    } else {
      return search(value, binaryNode.right);
    }
  }

  BinaryNode _rotateRight(BinaryNode disbalancedNode) {
    BinaryNode newRoot = disbalancedNode.left!;
    disbalancedNode.left = disbalancedNode.left!.right;
    newRoot.right = disbalancedNode;
    disbalancedNode.height = 1 +
        math.max(_getHeight(disbalancedNode.left),
            _getHeight(disbalancedNode.right));
    newRoot.height =
        1 + math.max(_getHeight(newRoot.left), _getHeight(newRoot.right));
    return newRoot;
  }

  BinaryNode _rotateLeft(BinaryNode disbalancedNode) {
    BinaryNode newRoot = disbalancedNode.right!;
    disbalancedNode.right = disbalancedNode.right!.left;
    newRoot.left = disbalancedNode;
    disbalancedNode.height = 1 +
        math.max(_getHeight(disbalancedNode.left),
            _getHeight(disbalancedNode.right));
    newRoot.height =
        1 + math.max(_getHeight(newRoot.left), _getHeight(newRoot.right));
    return newRoot;
  }

  int _getHeight(BinaryNode? binaryNode) {
    if (binaryNode == null) {
      return 0;
    }
    return binaryNode.height!;
  }

  int _difference(BinaryNode? node) {
    if (node == null) {
      return 0;
    }
    return _getHeight(node.left) - _getHeight(node.right);
  }

  BinaryNode _insertNode(BinaryNode? binaryNode, int value) {
    if (binaryNode == null) {
      BinaryNode newNode = BinaryNode();
      newNode.value = value;
      newNode.height = 1;
      return newNode;
    } else if (binaryNode.value! >= value) {
      binaryNode.left = _insertNode(binaryNode.left, value);
    } else {
      binaryNode.right = _insertNode(binaryNode.right, value);
    }
    binaryNode.height = 1 +
        math.max(
          _getHeight(binaryNode.left),
          _getHeight(binaryNode.right),
        );
    int balance = _difference(binaryNode);
    if (balance > 1 && value < binaryNode.left!.value!) {
      return _rotateRight(binaryNode);
    } else if (balance > 1 && value > binaryNode.left!.value!) {
      binaryNode.left = _rotateLeft(binaryNode.left!);
      return _rotateRight(binaryNode);
    } else if (balance < -1 && value > binaryNode.right!.value!) {
      return _rotateLeft(binaryNode);
    } else if (balance < -1 && value < binaryNode.right!.value!) {
      binaryNode.right = _rotateRight(binaryNode);
      return _rotateLeft(binaryNode);
    } else {
      return binaryNode;
    }
  }

  void insert(int value) => root = _insertNode(root, value);

  BinaryNode minimumNode(BinaryNode node) {
    if (node.left == null) {
      return node;
    }
    return minimumNode(node.left!);
  }

  BinaryNode? _deleteNode(BinaryNode? node, int nodeValue) {
    if (node == null) {
      print('Value not found in AVL-Tree');
      return node;
    } else if (node.value! > nodeValue) {
      node.left = _deleteNode(node.left, nodeValue);
    } else if (node.value! < nodeValue) {
      node.right = _deleteNode(node.right, nodeValue);
    } else {
      if (node.left != null && node.right != null) {
        BinaryNode temp = node;
        BinaryNode minimumNodeForRight = minimumNode(temp.right!);
        node.value = minimumNodeForRight.value;
        node.right = _deleteNode(node.right, minimumNodeForRight.value!);
      } else if (node.left != null) {
        node = node.left;
      } else if (node.right != null) {
        node = node.right;
      } else {
        node = null;
      }
    }
    int balance = _difference(node);
    if (balance > 1 && _difference(node?.left) >= 0) {
      return _rotateRight(node!);
    } else if (balance > 1 && _difference(node?.left) < 0) {
      node?.left = _rotateLeft(node.left!);
      return _rotateRight(node!);
    } else if (balance < -1 && _difference(node?.right) <= 0) {
      return _rotateLeft(node!);
    } else if (balance < -1 && _difference(node?.right) > 0) {
      node?.right = _rotateRight(node.right!);
      return _rotateLeft(node!);
    } else {
      return node;
    }
  }

  void deleteNode(int value) {
    root = _deleteNode(root, value);
  }

  void deleteAVL() {
    root = null;
    print('AVL Tree has been deleted...');
  }
}
