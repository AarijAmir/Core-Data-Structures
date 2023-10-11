import 'doubly_node.dart';

class CircularDoublyLinkedList<T> {
  DoublyNode? head;
  DoublyNode? tail;
  int size = 0;
  void createCircularDoublyLinkedList({required T value}) {
    DoublyNode<T> newDoublyNode = DoublyNode<T>();
    newDoublyNode.value = value;
    newDoublyNode.next = newDoublyNode;
    newDoublyNode.previous = newDoublyNode;
    head = newDoublyNode;
    tail = newDoublyNode;
    size = 1;
  }

  void insertNode({required T value, required int location}) {
    if (head == null) {
      createCircularDoublyLinkedList(value: value);
    } else {
      DoublyNode doublyNode = DoublyNode();
      doublyNode.value = value;
      if (location == 0) {
        doublyNode.next = head;
        doublyNode.previous = tail;
        tail?.next = doublyNode;
        head?.previous = doublyNode;
        head = doublyNode;
      } else if (location >= size) {
        doublyNode.next = head;
        doublyNode.previous = tail;
        tail?.next = doublyNode;
        head?.previous = doublyNode;
        tail = doublyNode;
      } else {
        DoublyNode? tempNode = head;
        int index = 0;
        while (location - 1 > index) {
          tempNode = tempNode?.next;
          index++;
        }
        doublyNode.next = tempNode?.next;
        doublyNode.previous = tempNode;
        tempNode?.next = doublyNode;
        doublyNode.next?.previous = doublyNode;
      }
      size++;
    }
  }

  void traversalCricularDoublyLinkedList() {
    if (head != null) {
      DoublyNode? tempNode = head;
      for (var i = 0; i < size; i++) {
        print(tempNode?.value);
        tempNode = tempNode?.next;
      }
    } else {
      print('Node does not exist');
    }
  }

  void reverseTraversalCircularDoublyLinkedList() {
    if (head != null) {
      DoublyNode? tempNode = tail;
      for (var i = 0; i < size; i++) {
        print(tempNode?.value);

        tempNode = tempNode?.previous;
      }
    } else {
      print('Linked List does not exist');
    }
  }

  bool searchNode({required T nodeValue}) {
    DoublyNode? tempNode = head;
    if (head == null) {
      print('Linked List does not exist');
      return false;
    }
    for (var i = 0; i < size; i++) {
      if (tempNode?.value == nodeValue) {
        print('$nodeValue Found At Location = $i');
        return true;
      }
      tempNode = tempNode?.next;
    }
    print('$nodeValue not found');
    return false;
  }

  void deleteNodeByLocation({required int location}) {
    if (head != null) {
      if (location == 0) {
        if (size == 1) {
          head?.next = null;
          tail?.next = null;
          head = null;
          tail = null;
        } else {
          head = head?.next;
          head?.previous = tail;
          tail?.next = head;
        }
        size--;
      } else if (location >= size) {
        if (size == 1) {
          head?.next = null;
          head?.previous = null;
          head = null;
          tail = null;
        } else {
          tail = tail?.previous;
          tail?.next = head;
          head?.previous = tail;
        }
        size--;
      } else {
        DoublyNode? tempNode = head;
        for (var i = 0; i < location - 1; i++) {
          tempNode = tempNode?.next;
        }
        tempNode?.next = tempNode.next?.next;
        tempNode?.next?.previous = tempNode;
        size--;
      }
    } else {
      print('Linked List does not exist');
    }
  }

  void deleteNodeByValue({required T value}) {
    int linkedListLocation = searchNodeByValue(nodeValue: value);
    if (linkedListLocation != -1) {
      deleteNodeByLocation(location: linkedListLocation);
      print('Node with value = $value has been deleted successfully');
    }
  }

  int searchNodeByValue({required T nodeValue}) {
    DoublyNode? tempNode = head;
    if (head == null) {
      print('Linked List does not exist');
      return -1;
    }
    for (var i = 0; i < size; i++) {
      if (tempNode?.value == nodeValue) {
        print('$nodeValue Found At Location = $i');
        return i;
      }
      tempNode = tempNode?.next;
    }
    print('$nodeValue not found');
    return -1;
  }

  void deleteEntireCircularDoublyLinkedList() {
    DoublyNode? tempNode = head;
    for (var i = 0; i < size; i++) {
      tempNode?.previous = null;
      tempNode = tempNode?.next;
    }
    head = null;
    tail = null;
    print(
        'The entire Circular Doubly Linked List has been deleted from the memory');
  }

  @override
  String toString() {
    // TODO: implement toString
    return '${head!.value}';
  }
}
