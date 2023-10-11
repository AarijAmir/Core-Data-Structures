import 'linked_list.dart';
import 'node.dart';
import 'questions.dart';

void main(List<String> args) {
  // LinkedList linkedList = LinkedList();
  // linkedList.createSinglyLinkedList(value: 10);
  // linkedList.insertNodeInSinglyLinkedList(value: 20);
  // linkedList.insertNodeInSinglyLinkedList(value: 30);
  // linkedList.insertNodeInSinglyLinkedList(value: 40);
  // linkedList.insertNodeInSinglyLinkedList(value: 50);
  // linkedList.insertNodeInSinglyLinkedList(value: 30);
  // linkedList.insertNodeInSinglyLinkedList(value: 60);
  // linkedList.traversalSinglyLinkedList();
  // Questions questions = Questions();
  // // questions.deleteDuplication(linkedList: linkedList);
  // // print('After Removing Duplications...');
  // // linkedList.traversalSinglyLinkedList();
  // // print('Nth...');
  // // print(questions.nthToLast(linkedList: linkedList, nth: 2)!.value);
  // print('-------------');
  // // questions.partition(linkedList: linkedList, value: 20);
  // // linkedList.traversalSinglyLinkedList();
  // print(questions.nthToLast(linkedList: linkedList, nth: 5)?.value);

  // LinkedList linkedListA = LinkedList();
  // linkedListA.insertNodeInSinglyLinkedList(value: 7);

  // linkedListA.insertNodeInSinglyLinkedList(value: 1);

  // linkedListA.insertNodeInSinglyLinkedList(value: 6);

  // LinkedList linkedListB = LinkedList();
  // linkedListB.insertNodeInSinglyLinkedList(value: 5);
  // linkedListB.insertNodeInSinglyLinkedList(value: 9);
  // linkedListB.insertNodeInSinglyLinkedList(value: 2);

  // Questions questions = Questions();
  // questions.sumLists(linkedListA, linkedListB).traversalSinglyLinkedList();

  LinkedList linkedListOne = LinkedList();
  linkedListOne.insertNodeInSinglyLinkedList(value: 3);

  linkedListOne.insertNodeInSinglyLinkedList(value: 1);

  linkedListOne.insertNodeInSinglyLinkedList(value: 5);

  linkedListOne.insertNodeInSinglyLinkedList(value: 9);

  linkedListOne.insertNodeInSinglyLinkedList(value: 19);
  LinkedList linkedListTwo = LinkedList();
  linkedListTwo.insertNodeInSinglyLinkedList(value: 2);

  linkedListTwo.insertNodeInSinglyLinkedList(value: 4);

  linkedListTwo.insertNodeInSinglyLinkedList(value: 6);
  Questions questions = Questions();
  questions.addSameNode(
      linkedListA: linkedListOne, linkedListB: linkedListTwo, nodeValue: 17);
  questions.addSameNode(
      linkedListA: linkedListOne, linkedListB: linkedListTwo, nodeValue: 2);
  questions.addSameNode(
      linkedListA: linkedListOne, linkedListB: linkedListTwo, nodeValue: 1);
  Node? intersectingNode =
      questions.findIntersection(linkedListOne, linkedListTwo);
  print(intersectingNode?.value);
}
