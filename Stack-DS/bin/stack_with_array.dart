class Stack<T> {
  Stack({required int size})
      : _list = List.filled(
          size,
          null,
          growable: false,
        );
  int top = -1;
  List<T?>? _list;

  bool isFull() => top == _list!.length - 1;
  bool isEmpty() => top == -1;
  void push({required T element}) {
    if (isFull()) {
      print('Stack is full!!! Overflow');
    } else {
      top++;
      _list![top] = element;
      print('Element $element has been pushed successfully');
    }
  }

  int size() => top + 1;

  dynamic pop() {
    if (isEmpty()) {
      print('Stack is already empty, No need to popped');
      return -1;
    } else if (_list != null) {
      T value = _list![top] as T;
      _list![top] = null;
      top--;
      return value;
    } else {
      print('List is Null');
      return null;
    }
  }

  dynamic peek() {
    if (isEmpty()) {
      print('Stack is Empty');
      return -1;
    } else if (_list != null) {
      return _list![top]!;
    }
    return null;
  }

  void deleteStack() {
    _list = null;
  }

  List<T?>? getStack() {
    return _list;
  }
}

// class Stack {
//   int _top;
//   List<int?>? _list;
//   Stack(int stackSize)
//       : _top = -1,
//         _list = List.filled(stackSize, null, growable: false);
//   bool get isEmpty => _top == -1;
//   bool get isFull => _top == _list!.length - 1;
//   void push(int value) {
//     if (isFull) {
//       print('Nothing more to push, Stack is already full! OVERFLOWED');
//     } else {
//       _top++;
//       _list![_top] = value;
//       print('Value $value is inserted into stack successfully');
//     }
//   }

//   int pop() {
//     if (isEmpty) {
//       print('Nothing more to pop, Stack is already empty! UNDERFLOW');
//       return -1;
//     } else {
//       int poppedValue = _list![_top]!;
//       _list![_top] = null;
//       _top--;
//       return poppedValue;
//     }
//   }

//   int peek() {
//     if (isEmpty) {
//       print('Stack is Empty');
//       return -1;
//     } else {
//       return _list![_top]!;
//     }
//   }

//   void deleteStack() {
//     _list = null;
//     print('Stack deleted successfully');
//   }

//   List<int?>? getStack() => _list;
// }
