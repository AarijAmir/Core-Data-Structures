void main(List<String> args) {
  // QueueWithLinkedList queueWithLinkedList = QueueWithLinkedList();
  // queueWithLinkedList.enqueue(10);
  // queueWithLinkedList.enqueue(20);
  // queueWithLinkedList.enqueue(30);
  // queueWithLinkedList.enqueue(40);
  // queueWithLinkedList.enqueue(50);
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.deQueue());
  // print(queueWithLinkedList.isEmpty());
  Iterable list = getRange(1, 3);
  for (var element in list) {
    print(element);
  }
  for (var element in list) {
    print(element);
  }
}

Iterable<int> getRange(int start, int finish) sync* {
  if (start <= finish) {
    yield start;
    for (final value in getRange(start + 1, finish)) {
      yield value;
    }
  }
}
