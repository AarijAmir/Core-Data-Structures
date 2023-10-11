class CircularQueue {
  List<int?>? _list;
  final int _size;
  int _beginningOfQueue = -1;
  int _topOfQueue = -1;
  CircularQueue(int size)
      : _size = size,
        _list = List.filled(size, null, growable: false);
  bool isEmpty() => _topOfQueue == -1;
  bool isFull() => (_topOfQueue + 1 == _beginningOfQueue)
      ? true
      : (_beginningOfQueue == 0 && _topOfQueue + 1 == _size)
          ? true
          : false;
  void enQueue(int value) {
    if (isFull()) {
      print('Queue is already full! Nothing to insert');
    } else if (isEmpty()) {
      _beginningOfQueue = 0;
      _topOfQueue++;
      _list![_topOfQueue] = value;
      print('Value = $value is successfully inserted into the Queue');
    } else {
      if (_topOfQueue + 1 == _size) {
        _topOfQueue = 0;
      } else {
        _topOfQueue++;
      }
      _list![_topOfQueue] = value;
      print('Value = $value is successfully inserted into the Queue');
    }
  }

  int deQueue() {
    if (isEmpty()) {
      print('Queue is already Empty nothing to deQueue');
      return -1;
    } else {
      int result = _list![_beginningOfQueue]!;
      _list![_beginningOfQueue] = null;
      if (_beginningOfQueue == _topOfQueue) {
        _beginningOfQueue = _topOfQueue = -1;
      } else if (_beginningOfQueue + 1 == _size) {
        _beginningOfQueue = 0;
      } else {
        _beginningOfQueue++;
      }
      return result;
    }
  }

  int peek() {
    if (isEmpty()) {
      print('Circular Queue is Empty');
      return -1;
    } else {
      return _list![_beginningOfQueue]!;
    }
  }

  void deleteQueue() {
    _list = null;
  }

  void printList() {
    print(_list);
  }
}
