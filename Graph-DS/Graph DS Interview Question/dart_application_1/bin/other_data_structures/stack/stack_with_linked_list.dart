import '../single_linked_list/single_linked_list.dart';

class StackWithLinkedList<T> {
  SingleLinkedList<T> singleLinkedList;
  StackWithLinkedList() : singleLinkedList = SingleLinkedList();
  void push(T value) {
    singleLinkedList.insertNode(nodeValue: value, location: 0);
  }

  bool isEmpty() {
    if (singleLinkedList.head == null) {
      return true;
    }
    return false;
  }

  T? pop() {
    T? result;
    if (isEmpty()) {
    } else {
      result = singleLinkedList.head!.value as T;
      singleLinkedList.deleteNode(0);
    }
    return result;
  }

  T? peek() {
    T? result;
    if (isEmpty()) {
    } else {
      result = singleLinkedList.head!.value as T;
    }
    return result;
  }

  void deleteStack() {
    singleLinkedList.head = null;
  }
}
