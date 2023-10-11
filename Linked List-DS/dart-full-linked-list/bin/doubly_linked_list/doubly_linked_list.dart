// import 'doubly_node.dart';

// class DoublyLinkedList {
//   DoublyNode? head;
//   DoublyNode? tail;
//   int size = 0;
//   DoublyNode createDoublyLinkedList({required int nodeValue}) {
//     DoublyNode node = DoublyNode();
//     node.value = nodeValue;
//     node.next = null;
//     node.previous = null;
//     head = node;
//     tail = node;
//     size = 1;
//     return head!;
//   }

//   void insertDoublyLinkedList({required int nodeValue, required int location}) {
//     if (head == null) {
//       createDoublyLinkedList(nodeValue: nodeValue);
//     } else {
//       DoublyNode node = DoublyNode();
//       node.value = nodeValue;
//       if (location == 0) {
//         node.next = head;
//         node.previous = null;
//         head?.previous = node;
//         head = node;
//       } else if (location >= size) {
//         node.next = null;
//         tail?.next = node;
//         node.previous = tail;
//         tail = node;
//       } else {
//         int index = 0;
//         DoublyNode tempNode = head!;
//         while (location - 1 > index) {
//           tempNode = tempNode.next!;
//           index++;
//         }
//         node.next = tempNode.next;
//         node.previous = tempNode;
//         tempNode.next = node;
//         node.next?.previous = node;
//       }
//       size++;
//     }
//   }

//   void traverseDoublyLinkedList() {
//     if (head == null) {
//       print('Doubly Linked List Does Not Exist...');
//     } else {
//       DoublyNode? tempNode = head!;
//       for (var i = 0; i <= size - 1; i++) {
//         print(tempNode?.value);
//         tempNode = tempNode?.next;
//       }
//     }
//   }

//   bool searchNode({required int value}) {
//     if (head != null) {
//       DoublyNode? tempNode = head;
//       for (var i = 0; i < size; i++) {
//         if (tempNode?.value == value) {
//           print('Value Found At Location $i');
//           return true;
//         }
//         tempNode = tempNode?.next;
//       }
//       print('Value Not Found');
//       return false;
//     } else {
//       print('Linked List Does Not Exist');
//       return false;
//     }
//   }

//   void reverseTraverseDoublyLinkedList() {
//     if (head == null) {
//       print('Linked List Does Not Exist');
//     } else {
//       DoublyNode? tempNode = tail;
//       int index = size;
//       while (index != 0) {
//         print(tempNode?.value);
//         tempNode = tempNode?.previous;
//         index--;
//       }
//     }
//   }

//   void deleteNodeDoublyLinkedList({required int location}) {
//     if (head == null) {
//       print('Linked List Does Not Exist');
//     } else {
//       if (location == 0) {
//         if (size == 1) {
//           head = null;
//           tail = null;
//         } else {
//           head = head?.next;
//           head?.previous = null;
//         }
//         size--;
//       } else if (location >= size) {
//         if (size == 1) {
//           head = null;
//           tail = null;
//         } else {
//           tail = tail?.previous;
//           tail?.next = null;
//         }
//         size--;
//       } else {
//         int index = 0;
//         DoublyNode? tempNode = head;
//         while (index < location - 1) {
//           tempNode = tempNode?.next;
//           index++;
//         }
//         tempNode?.next = tempNode.next?.next;
//         tempNode?.next?.previous = tempNode;
//         size--;
//       }
//     }
//   }

//   void deleteEntireDoublyLinkedList() {
//     DoublyNode? tempNode = head;
//     for (var i = 0; i < size; i++) {
//       tempNode?.previous = null;
//       tempNode = tempNode?.next;
//     }
//     head = null;
//     tail = null;
//     print('The entire linked list has been deleted from the memory');
//   }
// }
