import 'node.dart';

class SingleLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int size = 0;
  Node createSingleLinkedList({required T nodeValue}) {
    Node<T> node = Node();
    node.value = nodeValue;
    node.next = null;
    head = node;
    tail = node;
    size++;
    return head!;
  }

  void insertNode({required T nodeValue, required int location}) {
    Node<T> node = Node();
    node.value = nodeValue;
    if (head == null) {
      createSingleLinkedList(nodeValue: nodeValue);
      return;
    } else if (location == 0) {
      node.next = head;
      head = node;
    } else if (location >= size) {
      node.next = null;
      tail!.next = node;
      tail = node;
    } else {
      int index = 0;
      Node<T>? tempNode = head!;
      while (location - 1 > index) {
        tempNode = tempNode?.next;
        index++;
      }
      Node<T>? nextNode = tempNode?.next;
      node.next = nextNode;
      tempNode?.next = node;
    }
    size++;
  }

  void deleteNode(int location) {
    if (head == null) {
      print('Linked List Does Not Exist...');
      return;
    } else if (location == 0) {
      head = head?.next;
      size--;
      if (size == 0) {
        tail = null;
      }
    } else if (location >= size) {
      Node<T>? tempNode = head!;
      for (var i = 0; i < size - 2; i++) {
        tempNode = tempNode?.next;
      }
      if (size == 1) {
        tail = head = null;
        size--;
        return;
      }
      print('Value = ${tempNode?.value}');
      tempNode?.next = null;
      tail = tempNode;
      size--;
    } else {
      Node<T>? tempNode = head!;
      for (var i = 0; i < location - 1; i++) {
        tempNode = tempNode?.next;
      }
      tempNode?.next = tempNode.next?.next;
      size--;
    }
  }

  bool search({required int value}) {
    if (head == null) {
      print('Linked List Does Not Exist...');
      return false;
    } else {
      Node<T>? tempNode = head!;
      for (var i = 0; i < size; i++) {
        if (tempNode?.value == value) {
          print('Value =$value found in Linked List At Location $i...');
          return true;
        }
        tempNode = tempNode?.next;
      }
      print('Value $value not found in Linked List...');
      return false;
    }
  }

  void traverse() {
    if (head == null) {
      print('Linked List is Empty...');
    } else {
      if (size == 1) {
        print(head!.value);
      } else {
        Node<T>? tempNode = head!;
        while (tempNode?.next != null) {
          print(tempNode?.value);
          tempNode = tempNode?.next;
        }
      }
    }
  }

  void deleteLinkedList() {
    tail = head = null;
  }
}
