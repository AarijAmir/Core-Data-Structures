import 'single_linked_list/single_linked_list.dart';

class QueueWithLinkedList {
  SingleLinkedList singleLinkedList;
  QueueWithLinkedList() : singleLinkedList = SingleLinkedList();
  bool isEmpty() {
    if (singleLinkedList.head == null) {
      return true;
    } else {
      return false;
    }
  }

  void enqueue(int value) {
    singleLinkedList.insertNode(
        nodeValue: value, location: singleLinkedList.size);
    print('Successfully inserted value in Queue');
  }

  int deQueue() {
    if (isEmpty()) {
      return -1;
    } else {
      int value = singleLinkedList.head!.value!;
      singleLinkedList.deleteNode(0);
      return value;
    }
  }

  int peek() {
    if (isEmpty()) {
      return -1;
    } else {
      int value = singleLinkedList.head!.value!;
      return value;
    }
  }

  void deleteQueue() {
    singleLinkedList.head = null;
    singleLinkedList.tail = null;
    print('Queue is Successfully Deleted');
  }
}
