import 'linear_probing.dart';

int stop = 0;
void main() {
// Linear Probing
  LinearProbing linearProbing = LinearProbing(66);
  linearProbing.insertInHashTable(word: 'ABCD');
  linearProbing.insertInHashTable(word: 'EFGH');
  linearProbing.insertInHashTable(word: 'IJKLM');
  linearProbing.insertInHashTable(word: 'NOPQ');
  linearProbing.searchHashTable(word: 'RSTU');
  linearProbing.displayHashTable();

  // Direct Chaining
  //   DirectChaining directChaining = DirectChaining(13);
  // directChaining.insertHashTable(word: 'the');
  // directChaining.insertHashTable(word: 'quick');

  // directChaining.insertHashTable(word: 'brown');

  // directChaining.insertHashTable(word: 'fox');

  // directChaining.insertHashTable(word: 'over');
  // directChaining.displayHashTable();
  // directChaining.deleteKeyHashTable('fox');

  // directChaining.deleteKeyHashTable('quick');
  // directChaining.displayHashTable();
  // Double Hashing
  // DoubleHashing doubleHashing = DoubleHashing(13);
  // doubleHashing.insertInHashTable(word: 'The');
  // doubleHashing.insertInHashTable(word: 'quick');
  // doubleHashing.insertInHashTable(word: 'brown');
  // doubleHashing.insertInHashTable(word: 'fox');
  // doubleHashing.insertInHashTable(word: 'over');
  // doubleHashing.deleteKeyHashTable(word: 'quick');
  // doubleHashing.deleteKeyHashTable(word: 'fox');
  // doubleHashing.displayHashTable();

  // QuadraticProbing quadraticProbing = QuadraticProbing(13);
  // quadraticProbing.insertInHashTable(word: 'The');
  // quadraticProbing.insertInHashTable(word: 'quick');
  // quadraticProbing.insertInHashTable(word: 'brown');
  // quadraticProbing.insertInHashTable(word: 'fox');
  // quadraticProbing.insertInHashTable(word: 'over');
  // quadraticProbing.deleteKeyHashTable(word: 'fox');
  // quadraticProbing.deleteKeyHashTable(word: 'over');
  // quadraticProbing.searchHashTable(word: 'brown');
  // quadraticProbing.displayHashTable();
}
