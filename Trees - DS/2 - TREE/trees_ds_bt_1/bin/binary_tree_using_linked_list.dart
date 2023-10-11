import 'binary_node.dart';
import 'single_linked_list/queue_with_linked_list.dart';

class BinaryTreeLinkedList<T> {
  BinaryNode<T>? root;
  void preOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    } else {
      print(node.value);
      preOrderTraversal(node.left);
      preOrderTraversal(node.right);
    }
  }

  void postOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    } else {
      postOrderTraversal(node.left);
      postOrderTraversal(node.right);
      print(node.value);
    }
  }

  void inOrderTraversal(BinaryNode? node) {
    if (node == null) {
      return;
    } else {
      inOrderTraversal(node.left);
      print(node.value);
      inOrderTraversal(node.right);
    }
  }

  void levelOrderTraversal() {
    QueueWithLinkedList<BinaryNode<T>> queue =
        QueueWithLinkedList<BinaryNode<T>>();
    queue.enqueue(root!);
    while (!queue.isEmpty) {
      BinaryNode<T> presentNode = queue.deQueue()!;
      print(presentNode.value);
      if (presentNode.left != null) {
        queue.enqueue(presentNode.left!);
      }
      if (presentNode.right != null) {
        queue.enqueue(presentNode.right!);
      }
    }
  }

  void search(T value) {
    QueueWithLinkedList<BinaryNode<T>> queueWithLinkedList =
        QueueWithLinkedList<BinaryNode<T>>();
    queueWithLinkedList.enqueue(root!);

    while (!(queueWithLinkedList.isEmpty)) {
      BinaryNode<T> presentBinaryNode = queueWithLinkedList.deQueue()!;
      if (presentBinaryNode.value == value) {
        print('Value = $value found in Binary Tree');
        return;
      } else {
        if (presentBinaryNode.left != null) {
          queueWithLinkedList.enqueue(presentBinaryNode.left!);
        }
        if (presentBinaryNode.right != null) {
          queueWithLinkedList.enqueue(presentBinaryNode.right!);
        }
      }
    }

    print('Value = $value not found in Binary Tree');
  }

  void insert(T value) {
    BinaryNode<T> newNode = BinaryNode<T>();
    newNode.value = value;
    if (root == null) {
      root = newNode;
      print('Root Node Is Inserted');
      return;
    }
    QueueWithLinkedList<BinaryNode<T?>>? queueWithLinkedList =
        QueueWithLinkedList<BinaryNode<T?>>();
    queueWithLinkedList.enqueue(root!);
    while (!queueWithLinkedList.isEmpty) {
      BinaryNode<T?>? presentBinaryNode = queueWithLinkedList.deQueue()!;
      if (presentBinaryNode.left == null) {
        presentBinaryNode.left = newNode;
        print('Node Inserted Successfully...');
        break;
      } else if (presentBinaryNode.right == null) {
        print('Node Inserted Successfully...');
        presentBinaryNode.right = newNode;
        break;
      } else {
        queueWithLinkedList.enqueue(presentBinaryNode.left!);
        queueWithLinkedList.enqueue(presentBinaryNode.right!);
      }
    }
  }

  BinaryNode getDeepestNode() {
    QueueWithLinkedList<BinaryNode<T?>>? queueWithLinkedList =
        QueueWithLinkedList<BinaryNode<T?>>();
    queueWithLinkedList.enqueue(root!);
    BinaryNode<T?>? presentNode;
    while (!queueWithLinkedList.isEmpty) {
      presentNode = queueWithLinkedList.deQueue();
      if (presentNode?.left != null) {
        queueWithLinkedList.enqueue(presentNode!.left!);
      }
      if (presentNode?.right != null) {
        queueWithLinkedList.enqueue(presentNode!.right!);
      }
    }
    return presentNode!;
  }

  void deleteDeepestNode() {
    QueueWithLinkedList<BinaryNode<T?>>? queueWithLinkedList =
        QueueWithLinkedList<BinaryNode<T?>>();
    queueWithLinkedList.enqueue(root!);
    BinaryNode<T?>? previousNode;
    BinaryNode<T?>? currentNode;
    while (!queueWithLinkedList.isEmpty) {
      previousNode = currentNode;
      currentNode = queueWithLinkedList.deQueue();
      if (currentNode?.left == null) {
        previousNode?.right = null;
        return;
      } else if (currentNode?.right == null) {
        currentNode?.left = null;
        return;
      } else {
        queueWithLinkedList.enqueue(currentNode!.left!);
        queueWithLinkedList.enqueue(currentNode.right!);
      }
    }
  }

  void deleteNode(T value) {
    if (root == null) {
      print('Tree does not exist...');
      return;
    }
    QueueWithLinkedList<BinaryNode<T?>>? queueWithLinkedList =
        QueueWithLinkedList<BinaryNode<T?>>();
    queueWithLinkedList.enqueue(root!);
    while (!queueWithLinkedList.isEmpty) {
      BinaryNode<T?>? currentNode = queueWithLinkedList.deQueue();
      if (currentNode!.value == value) {
        currentNode.value = getDeepestNode().value;
        deleteDeepestNode();
        print('Node is deleted');
        return;
      } else {
        if (currentNode.left != null) {
          queueWithLinkedList.enqueue(currentNode.left!);
        }
        if (currentNode.right != null) {
          queueWithLinkedList.enqueue(currentNode.right!);
        }
      }
    }
    print('The Node does not exists in the Binary Tree...');
  }

  void deleteEntireBinaryTree() {
    root = null;
    print('Binary Tree has been deleted successfully...');
  }
}
