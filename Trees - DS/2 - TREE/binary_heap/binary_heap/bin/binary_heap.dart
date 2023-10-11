class BinaryHeap {
  List<int?>? _list;
  int _sizeOfHeap;
  BinaryHeap(int size)
      : _list = List.filled(size + 1, null),
        _sizeOfHeap = 0 {
    print('Binary Heap has been created...');
  }
  bool get isEmpty => _sizeOfHeap == 0 ? true : false;
  int? get peek => (isEmpty) ? null : _list![1];
  // int? get size => _sizeOfHeap;
  void levelOrderTraversal() {
    for (var i = 1; i <= _sizeOfHeap; i++) {
      print(_list![i]);
    }
  }
   /// heapify for insertion
  void _heapifyBottomToTop(int index, HeapType heapType) {
    if (index <= 1) {
      return;
    }
    int parent = index ~/ 2;
    if (heapType == HeapType.max) {
      if (_list![index]! > _list![parent]!) {
        int temp = _list![index]!;
        _list![index] = _list![parent];
        _list![parent] = temp;
      }
    } else if (heapType == HeapType.min) {
      if (_list![index]! < _list![parent]!) {
        int temp = _list![index]!;
        _list![index] = _list![parent];
        _list![parent] = temp;
      }
    }
    _heapifyBottomToTop(parent, heapType);
  }

  void inOrderTraversal(int index) {
    if (index > _sizeOfHeap) {
      return;
    }
    inOrderTraversal(index * 2);

    print(_list![index]);
    inOrderTraversal(index * 2 + 1);
  }

  void preOrderTraversal(int index) {
    if (index > _sizeOfHeap) {
      return;
    }
    print(_list![index]);
    preOrderTraversal(index * 2);
    preOrderTraversal(index * 2 + 1);
  }

  void postOrderTraversal(int index) {
    if (index > _sizeOfHeap) {
      return;
    }
    postOrderTraversal(index * 2);
    postOrderTraversal(index * 2 + 1);
    print(_list![index]);
  }

 

  void insert(int value, HeapType heapType) {
    _sizeOfHeap++;
    if (_sizeOfHeap < _list!.length) {
      _list![_sizeOfHeap] = value;
      _heapifyBottomToTop(_sizeOfHeap, heapType);
      print('Inserted Value = $value successfully in heap');
    } else {
      print('Heap is full according to size');
    }
  }

  int? extractHeadOfBinaryHeap(HeapType heapType) {
    if (isEmpty) {
      print('Binary Heap is null');
      return null;
    } else {
      int extractedValue = _list![1]!;
      _list![1] = _list![_sizeOfHeap];
      _sizeOfHeap--;
      _heapifyTopToBottom(1, heapType);
      return extractedValue;
    }
  }

  void deleteHeap() {
    _list = null;
  }

  void _heapifyTopToBottom(int index, HeapType heapType) {
    int leftChild = index * 2;
    int rightChild = index * 2 + 1;
    int whichSwapChild = 0;
    if (_sizeOfHeap < leftChild) {
      return;
    }
    if (heapType == HeapType.max) {
      if (leftChild == _sizeOfHeap) {
        if (_list![leftChild]! > _list![index]!) {
          int temp = _list![index]!;
          _list![index] = _list![leftChild];
          _list![leftChild] = temp;
        }
        return;
      } else {
        if (_list![leftChild]! > _list![rightChild]!) {
          whichSwapChild = leftChild;
        } else {
          whichSwapChild = rightChild;
        }
        if (_list![whichSwapChild]! > _list![index]!) {
          int temp = _list![whichSwapChild]!;
          _list![whichSwapChild] = _list![index]!;
          _list![index] = temp;
        }
      }
    } else if (heapType == HeapType.min) {
      if (leftChild == _sizeOfHeap) {
        if (_list![leftChild]! < _list![index]!) {
          int temp = _list![index]!;
          _list![index] = _list![leftChild];
          _list![leftChild] = temp;
        }
        return;
      } else {
        if (_list![leftChild]! < _list![rightChild]!) {
          whichSwapChild = leftChild;
        } else {
          whichSwapChild = rightChild;
        }
        if (_list![whichSwapChild]! < _list![index]!) {
          int temp = _list![whichSwapChild]!;
          _list![whichSwapChild] = _list![index]!;
          _list![index] = temp;
        }
      }
    }
    _heapifyTopToBottom(whichSwapChild, heapType);
  }
}
enum HeapType { min, max }
