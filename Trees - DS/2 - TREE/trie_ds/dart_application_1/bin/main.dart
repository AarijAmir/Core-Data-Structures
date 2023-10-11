import 'trie.dart';

// void main(List<String> args) {
//   Trie trie = Trie();

// }

void main(List<String> arguments) {
  Trie trie = Trie();
  trie.insert('BAP');
  trie.insert('API');
  trie.insert('APIS');
  trie.delete('API');
}
