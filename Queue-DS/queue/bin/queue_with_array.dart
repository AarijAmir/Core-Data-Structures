class CustomQueue<T> {
  List<T?>? _list;
  CustomQueue({required int size})
      : _list = List.filled(size, null, growable: false),
        _length = size;
  int beginningOfQueue = -1;
  int topOfQueue = -1;
  late final int _length;
  bool get isEmpty =>
      beginningOfQueue == -1 || beginningOfQueue == _list!.length;
  bool get isFull => topOfQueue == _list!.length - 1;
  void enqueue(T? element) {
    if (isFull) {
      print('Queue is already Fulled, No need to enter, Overflowed');
    } else if (isEmpty) {
      beginningOfQueue = 0;
      topOfQueue = 0;
      _list![topOfQueue] = element;
      print('Element is Enqueued Successfully...');
    } else {
      topOfQueue++;
      _list![topOfQueue] = element;
      print('Element is Enqueued Successfully...');
    }
  }

  T? dequeue() {
    if (isEmpty) {
      print('No Element can Dequeue, Queue is already Empty, Underflowed');
    } else {
      final value = _list![beginningOfQueue];
      beginningOfQueue++;
      if (beginningOfQueue > topOfQueue) {
        beginningOfQueue = topOfQueue = -1;
      }
      return value;
    }
    return null;
  }

  T? peek() {
    if (!isEmpty) {
      return _list![beginningOfQueue];
    } else {
      print('No Element in Queue, Queue is Empty');
    }
    return null;
  }

  void deleteQueue() {
    print('Queue is deleted');
    print('New Queue created with the size $_length');
    _list = List.filled(_length, null, growable: false);
  }
}


// class QueueWithArray {
//   QueueWithArray(int size)
//       : _list = List.filled(size, null, growable: false),
//         _beginningOfQueue = -1,
//         _topOfQueue = -1 {
//     print('List Length = ${_list!.length}');
//   }
//   List? _list;
//   int _beginningOfQueue;
//   int _topOfQueue;
//   bool isFull() => _beginningOfQueue == _list!.length;
//   bool isEmpty() => _topOfQueue == -1 || _beginningOfQueue == _list!.length;
//   void enQueue(int element) {
//     if (isFull()) {
//       print('Queue is already full, No other element can be enQueue');
//     } else if (isEmpty()) {
//       _beginningOfQueue = 0;
//       _topOfQueue++;
//       _list![_topOfQueue] = element;
//       print('Value is enQueued in Queue Successfully');
//     } else {
//       if (_topOfQueue < _list!.length - 1) {
//         _topOfQueue++;
//         _list![_topOfQueue] = element;
//         print('Value is enQueued in Queue Successfully');
//       } else {
//         print('Size is already Full, Nothing more to EnQueue');
//       }
//     }
//   }

//   int deQueue() {
//     if (isEmpty()) {
//       print('Queue is already empty nothing can be deQueue');
//       return -1;
//     } else {
//       int result = _list![_beginningOfQueue];
//       _beginningOfQueue++;
//       if (_beginningOfQueue > _topOfQueue) {
//         _beginningOfQueue = _topOfQueue = -1;
//       }
//       return result;
//     }
//   }

//   int peek() {
//     if (isEmpty()) {
//       print('Queue is already empty nothing in peek');
//       return -1;
//     } else {
//       return _list![_beginningOfQueue];
//     }
//   }

//   void deleteQueue() {
//     _list = null;
//     print('Queue is Deleted Successfully');
//   }
// }
