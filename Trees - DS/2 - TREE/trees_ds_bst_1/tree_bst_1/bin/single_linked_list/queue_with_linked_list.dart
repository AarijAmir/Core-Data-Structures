import 'single_linked_list.dart';

class QueueWithLinkedList<T> {
  SingleLinkedList<T> singleLinkedList;
  QueueWithLinkedList() : singleLinkedList = SingleLinkedList();
  bool get isEmpty => (singleLinkedList.head == null) ? true : false;

  void enqueue(T value) => singleLinkedList.insertNode(
      nodeValue: value, location: singleLinkedList.size);

  T? deQueue() {
    if (isEmpty) {
      return null;
    } else {
      T value = singleLinkedList.head!.value as T;
      singleLinkedList.deleteNode(0);
      return value;
    }
  }

  T? peek() {
    if (isEmpty) {
      return null;
    } else {
      T value = singleLinkedList.head!.value as T;
      return value;
    }
  }

  void deleteQueue() => singleLinkedList.head = singleLinkedList.tail = null;
}
