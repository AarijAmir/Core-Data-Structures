import 'tree.dart';

void main(List<String> args) {
  TreeNode drinks = TreeNode(data: 'Drink');

  TreeNode hot = TreeNode(data: 'Hot');

  TreeNode cold = TreeNode(data: 'Cold');

  TreeNode tea = TreeNode(data: 'Tea');

  TreeNode coffee = TreeNode(data: 'Coffee');

  TreeNode wine = TreeNode(data: 'Wine');

  TreeNode bear = TreeNode(data: 'Bear');

  drinks.addChild(cold);
  drinks.addChild(hot);
  cold.addChild(wine);
  cold.addChild(bear);
  hot.addChild(coffee);
  hot.addChild(tea);
  print(drinks.print(0));
}
