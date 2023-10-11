part 'node.dart';

class CircularSingleLinkedList {
  Node? head;
  Node? tail;
  int size = 0;
  Node createCircularSingleLinkedList({required int nodeValue}) {
    Node node = Node();
    node.value = nodeValue;
    node.next = node;
    head = node;
    tail = node;
    size = 1;
    return head!;
  }

  void insertCSLL({required int nodeValue, required int location}) {
    Node node = Node();
    node.value = nodeValue;
    if (head == null) {
      createCircularSingleLinkedList(nodeValue: nodeValue);
    } else {
      if (location == 0) {
        node.next = head;
        head = node;
        tail?.next = head;
      } else if (location >= size) {
        tail?.next = node;
        tail = node;
        tail?.next = head;
      } else {
        Node tempNode = head!;
        int index = 0;
        while (index < location - 1) {
          tempNode = tempNode.next!;
          index++;
        }
        node.next = tempNode.next;
        tempNode.next = node;
      }
      size++;
    }
  }

  void traversalCircularSinglyLinkedList() {
    Node? tempNode = head;
    if (tempNode == null) {
      print('Circular Linked List is Empty...');
      return;
    }
    for (var i = 0; i < size; i++) {
      print(tempNode?.value);
      tempNode = tempNode?.next;
    }
  }

  bool searchNode(int nodeValue) {
    if (head == null) {
      print('Linked List Is Empty....');
      return false;
    } else {
      Node tempNode = head!;
      for (var i = 0; i < size; i++) {
        if (tempNode.value == nodeValue) {
          print('Node ${tempNode.value} Found At Location $i');
          return true;
        }
        tempNode = tempNode.next!;
      }
    }
    print('Node does not exist...');
    return false;
  }

  void deleteNode(int location) {
    if (head == null) {
      print('Circular Singly Linked List Does Not Exist');
    } else {
      if (location == 0) {
        if (size == 1) {
          tail = null;
          head?.next = null;
          head = null;
        } else {
          head = head?.next;
          tail?.next = head;
        }
        size--;
      } else if (location >= size) {
        Node? tempNode = head;
        for (var i = 0; i < size - 2; i++) {
          tempNode = tempNode?.next;
        }
        if (size == 1) {
          head?.next = null;
          tail = null;
          head = null;
          size--;
        } else {
          Node? tempNode = head;
          for (var i = 0; i < size - 1; i++) {
            tempNode = tempNode?.next;
          }
          tempNode?.next = tail?.next;
          tail?.next = null;
          tail = tempNode;
          size--;
        }
      } else {
        Node? tempNode = head;
        for (var i = 0; i < location - 1; i++) {
          tempNode = tempNode?.next;
        }
        tempNode?.next = tempNode.next?.next;
        size--;
      }
    }
  }

  void deleteLinkedList() {
    head?.next = null;
    head = null;
    tail = null;
    print('Delete Linked List From Memory...');
  }
}
