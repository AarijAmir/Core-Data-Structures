import '../single_linked_list/node.dart';
import '../single_linked_list/single_linked_list.dart';

class PriorityQueue<T extends Comparable<T>> {
  SingleLinkedList<T> linkedList = SingleLinkedList<T>();
  void enqueue(T value) {
    if (linkedList.head == null ||
        value.compareTo(linkedList.head!.value!) < 0) {
      linkedList.insertNode(nodeValue: value, location: 0);
    } else {
      int count = 1;
      Node<T>? current = linkedList.head;
      while (current?.next != null &&
          value.compareTo(current!.next!.value!) >= 0) {
        current = current.next;
        count++;
      }

      linkedList.insertNode(nodeValue: value, location: count);
    }
  }

  void addAll(List<T> elements) {
    print(elements);
    for (T element in elements) {
      enqueue(element);
    }
  }

  T? dequeue() {
    if (isEmpty()) return null;

    Node<T>? removedNode = linkedList.head!;
    linkedList.deleteNode(0);
    return removedNode.value;
  }

  bool contains(T value) {
    Node<T>? current = linkedList.head;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  bool isEmpty() {
    return linkedList.head == null;
  }

  int getSize() {
    return linkedList.size;
  }
}
