import 'binary_heap.dart';

void main(List<String> args) {
  BinaryHeap binaryHeap = BinaryHeap(6);
  binaryHeap.insert(10, HeapType.min);
  binaryHeap.insert(3, HeapType.min);
  binaryHeap.insert(12, HeapType.min);
  binaryHeap.insert(4, HeapType.min);
  binaryHeap.insert(122, HeapType.min);
  binaryHeap.insert(13, HeapType.min);
  binaryHeap.levelOrderTraversal();
  print('------');
  binaryHeap.extractHeadOfBinaryHeap(HeapType.min);
  binaryHeap.levelOrderTraversal();
}
