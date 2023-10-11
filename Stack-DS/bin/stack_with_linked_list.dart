import 'single_linked_list/single_linked_list.dart';

class StackWithLinkedList {
  SingleLinkedList singleLinkedList;
  StackWithLinkedList() : singleLinkedList = SingleLinkedList();
  void push(int value) {
    singleLinkedList.insertNode(nodeValue: value, location: 0);
    print('Inserted Value In Stack...');
  }

  bool isEmpty() {
    if (singleLinkedList.head == null) {
      return true;
    }
    return false;
  }

  int pop() {
    int result = -1;
    if (isEmpty()) {
      print('Stack Is Empty');
    } else {
      result = singleLinkedList.head!.value!;
      singleLinkedList.deleteNode(0);
    }
    return result;
  }

  int peek() {
    int result = -1;
    if (isEmpty()) {
      print('Stack Is Empty');
    } else {
      result = singleLinkedList.head!.value!;
    }
    return result;
  }

  void deleteStack() {
    singleLinkedList.head = null;
    print('Stack has been deleted from the memory!');
  }
}
