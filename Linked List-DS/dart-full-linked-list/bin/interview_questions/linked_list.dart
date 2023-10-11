import 'node.dart';

class LinkedList {
  Node? head;
  Node? tail;
  int size = 0;
  Node createSinglyLinkedList({required int value}) {
    Node newNode = Node();
    newNode.value = value;
    head = newNode;
    tail = newNode;
    size++;
    return head!;
  }

  void insertNodeInSinglyLinkedList({required int value}) {
    if (head == null) {
      createSinglyLinkedList(value: value);
    } else {
      Node newNode = Node();
      newNode.value = value;
      newNode.next = null;
      tail?.next = newNode;
      tail = newNode;
      size++;
    }
  }

  void traversalSinglyLinkedList() {
    Node? tempNode = head;
    for (var i = 0; i < size; i++) {
      print(tempNode?.value);
      tempNode = tempNode?.next;
    }
  }
}
