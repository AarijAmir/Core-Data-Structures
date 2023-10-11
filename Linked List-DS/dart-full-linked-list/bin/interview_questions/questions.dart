import '../interview_questions/linked_list.dart';
import '../interview_questions/node.dart';

class Questions {
  // Remove any duplicate value from Linked List....
  void deleteDuplication({required LinkedList linkedList}) {
    Set<int> set = <int>{};
    Node? currentNode = linkedList.head;
    Node? prev;
    if (currentNode != null) {
      while (currentNode != null) {
        int currentValue = currentNode.value!;
        if (set.contains(currentValue)) {
          prev?.next = currentNode.next;
          linkedList.size--;
        } else {
          set.add(currentValue);
          prev = currentNode;
        }
        currentNode = currentNode.next;
      }
    } else {
      print('Linked List Is Already Empty, Nothing to Remove Any Duplicate...');
    }
  }

  Node? nthToLast({required LinkedList linkedList, required int nth}) {
    Node? nodeOne = linkedList.head;
    Node? nodeTwo = linkedList.head;
    for (var i = 0; i <= nth; i++) {
      if (nodeTwo == null) {
        return null;
      } else {
        nodeTwo = nodeTwo.next;
      }
    }
    while (nodeTwo != null) {
      nodeTwo = nodeTwo.next;
      nodeOne = nodeOne?.next;
    }
    return nodeOne;
  }

  LinkedList partition({required LinkedList linkedList, required int value}) {
    Node? currentNode = linkedList.head;
    linkedList.tail = linkedList.head;
    while (currentNode != null) {
      Node? next = currentNode.next;
      if (currentNode.value! < value) {
        currentNode.next = linkedList.head;
        linkedList.head = currentNode;
      } else {
        linkedList.tail!.next = currentNode;
        linkedList.tail = currentNode;
      }
      currentNode = next;
    }
    linkedList.tail?.next = null;
    return linkedList;
  }

  LinkedList sumLists(LinkedList linkedListA, LinkedList linkedListB) {
    Node? nodeOne = linkedListA.head;
    Node? nodeTwo = linkedListB.head;
    int carry = 0;

    LinkedList resultLinkedList = LinkedList();
    while (nodeTwo != null || nodeTwo != null) {
      int result = carry;
      if (nodeOne != null) {
        result += nodeOne.value!;
        nodeOne = nodeOne.next;
      }
      result += nodeTwo.value!;
      nodeTwo = nodeTwo.next;
      resultLinkedList.insertNodeInSinglyLinkedList(value: result % 10);
      carry = result ~/ 10;
    }
    return resultLinkedList;
  }

  /// INTERSECTION METHOD
  Node? getKthNode(Node? head, int k) {
    Node? currentNode = head;
    while (k > 0 && currentNode != null) {
      currentNode = currentNode.next;
      k--;
    }
    return currentNode;
  }

  Node? findIntersection(LinkedList linkedListOne, LinkedList linkedListTwo) {
    if (linkedListOne.head == null || linkedListTwo.head == null) {
      return null;
    }
    if (linkedListOne.tail != linkedListTwo.tail) {
      return null;
    }
    Node? shorterNode = Node();
    Node? longerNode = Node();
    int longerLinkedListSize = 0;
    int shorterLinkedListSize = 0;
    if (linkedListOne.size > linkedListTwo.size) {
      longerNode = linkedListOne.head!;
      shorterNode = linkedListTwo.head!;
      longerLinkedListSize = linkedListOne.size;
      shorterLinkedListSize = linkedListTwo.size;
    } else {
      shorterNode = linkedListOne.head!;
      longerNode = linkedListTwo.head!;

      longerLinkedListSize = linkedListTwo.size;
      shorterLinkedListSize = linkedListOne.size;
    }
    int difference = longerLinkedListSize - shorterLinkedListSize;
    longerNode = getKthNode(longerNode, difference);

    while (shorterNode != longerNode) {
      shorterNode = shorterNode?.next;
      longerNode = longerNode?.next;
    }
    return longerNode;
  }

  // add same to two different LinkedLists create a method that add same node to two different
  // linked list.
  void addSameNode(
      {required LinkedList linkedListA,
      required LinkedList linkedListB,
      required int nodeValue}) {
    Node node = Node();
    node.value = nodeValue;
    linkedListA.tail?.next = node;
    linkedListA.tail = node;
    linkedListB.tail?.next = node;
    linkedListB.tail = node;
  }
}
