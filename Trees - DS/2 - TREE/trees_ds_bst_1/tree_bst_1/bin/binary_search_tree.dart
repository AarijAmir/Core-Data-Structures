import 'binary_node.dart';
import 'single_linked_list/queue_with_linked_list.dart';

class BinarySearchTree {
  BinaryNode? root;
  BinarySearchTree() : root = null;
  BinaryNode _insertNode(int value, BinaryNode? currentNode) {
    if (currentNode == null) {
      BinaryNode binaryNode = BinaryNode();
      binaryNode.value = value;
      print('Binary Node created successfully with the value = $value');
      root ??= binaryNode;
      return binaryNode;
    } else if (currentNode.value! >= value) {
      currentNode.left = _insertNode(value, currentNode.left);
      return currentNode;
    } else {
      currentNode.right = _insertNode(value, currentNode.right);
      return currentNode;
    }
  }

  BinaryNode insert(int value) {
    return _insertNode(value, root);
  }

  void preOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    print(node.value);
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  void inOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    inOrderTraversal(node.left);
    print(node.value);
    inOrderTraversal(node.right);
  }

  void postOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    }
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
    print(node.value);
  }

  void levelOrderTraversal() {
    QueueWithLinkedList<BinaryNode> queueWithLinkedList =
        QueueWithLinkedList<BinaryNode>();
    if (root == null) {
      return;
    }
    queueWithLinkedList.enqueue(root!);
    while (!queueWithLinkedList.isEmpty) {
      BinaryNode? poppedNode = queueWithLinkedList.deQueue();
      print(poppedNode?.value);
      if (poppedNode?.left != null) {
        queueWithLinkedList.enqueue(poppedNode!.left!);
      }
      if (poppedNode?.right != null) {
        queueWithLinkedList.enqueue(poppedNode!.right!);
      }
    }
  }

  BinaryNode? search(BinaryNode? node, int value) {
    if (node == null) {
      print('The value not found in BST');
      return null;
    } else {
      if (node.value == value) {
        print('The value: $value found in BST');
      } else if (value <= node.value!) {
        return search(node.left, value);
      } else {
        return search(node.right, value);
      }
    }
    return null;
  }

  BinaryNode? deleteNode(int value, BinaryNode? root) {
    if (root == null) {
      print('Node does not exist.');
      return null;
    } else if (root.value! > value) {
      root.left = deleteNode(value, root.left);
    } else if (root.value! < value) {
      root.right = deleteNode(value, root.right);
    } else {
      if (root.left != null && root.right != null) {
        BinaryNode? minimumBinaryNode = minimumNode(root.right);
        root.value = minimumBinaryNode?.value;
        root.right = deleteNode(minimumBinaryNode!.value!, root.right);
      } else if (root.left != null) {
        root = root.left;
      } else if (root.right != null) {
        root = root.right;
      } else {
        root = null;
      }
    }
    return root;
  }

  BinaryNode? minimumNode(BinaryNode? binaryNode) {
    if (binaryNode?.left == null) {
      return binaryNode;
    }
    return minimumNode(binaryNode?.left);
  }
}
