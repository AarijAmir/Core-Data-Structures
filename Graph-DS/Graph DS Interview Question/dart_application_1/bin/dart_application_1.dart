import 'graph.dart';
import 'graph_node.dart';

void main(List<String> arguments) {
  int charCode = 65;
  print(String.fromCharCode(65));
  List<GraphNode> nodeList = [
    for (int i = 0; i <= 9; i++)
      GraphNode(name: String.fromCharCode(charCode++), index: i)
  ];
  Graph graph = Graph(nodeList);
  graph.addDirectedEdge(0, 1); // A->B
  graph.addDirectedEdge(0, 2); // A->C
  graph.addDirectedEdge(0, 3); // A->D
  graph.addDirectedEdge(1, 9); // B->J
  graph.addDirectedEdge(2, 6); // C->G
  graph.addDirectedEdge(4, 0); // E->A
  graph.addDirectedEdge(4, 5); // E->F
  graph.addDirectedEdge(5, 8); // F->I
  graph.addDirectedEdge(6, 7); // G->H
  graph.addDirectedEdge(6, 3); // G->D
  print(nodeList);
  print(graph.search(nodeList[4], nodeList[0]));
}
