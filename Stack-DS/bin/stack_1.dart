// Same problem solving using an easiest and low execution cost approach
// Cost will be N.

import 'stack_with_linked_list.dart';

void main(List<String> arguments) {
  StackWithLinkedList stackWithLinkedList = StackWithLinkedList();
  stackWithLinkedList.push(10);
  stackWithLinkedList.push(20);
  stackWithLinkedList.push(30);
  print(stackWithLinkedList.peek());
  print(stackWithLinkedList.pop());
}

// For isolating operand and operator from List an expensive approach
// Cost will be N^2
// class ExpressionEvaluation {
//   final String _expression;
//   final Stack<num> _numberStack;
//   final Stack<String> _operatorStack;
//   List<String> operatorList = <String>[];
//   List<num> operandList = <num>[];

//   ExpressionEvaluation({required String expression})
//       : _expression = expression,
//         _numberStack = Stack(),
//         _operatorStack = Stack() {
//     for (var i = 0; i < expression.length; i++) {
//       if ((expression[i] == '/' ||
//           expression[i] == '*' ||
//           expression[i] == '-' ||
//           expression[i] == '+')) {
//         // for setting operator
//         operatorList.add(expression[i]);
//         int k = i - 1;
//         // for setting operands before operator
//         List beforeLastOperand = [];
//         while (!(expression[k] == '+' ||
//             expression[k] == '-' ||
//             expression[k] == '/' ||
//             expression[k] == '*')) {
//           {
//             beforeLastOperand.add(expression[k]);
//             k--;
//             if (k < 0) {
//               break;
//             }
//           }
//         }
//         operandList.add(num.parse(beforeLastOperand.reversed.join()));
//       }
//     }
//     List lastOperand = [];
//     int j = expression.length - 1;
//     // for setting operand after last operator
//     while (!(expression[j] == '+' ||
//         expression[j] == '-' ||
//         expression[j] == '/' ||
//         expression[j] == '*')) {
//       lastOperand.add(expression[j]);
//       j--;
//     }
//     operandList.add(num.parse(lastOperand.reversed.join()));
//   }



//   // num evaluateExpression(){

//   // }
// }


// ------------------------------------

//   String expression = '3.95+4.00+3.80+3.65+3.53+3.53+3.58+3.22/8';

//   List<num> operandList = [];
//   List<String> operatorList = [];
//   String operand = '';

//   Stack<String> operatorStack = Stack<String>(size: expression.length - 1);
//   List<dynamic> resultantList = [];
//   String startNegativeOperand = '-';
//   bool isNegativeNumber = false;

//   for (var i = 0; i < expression.length; i++) {}
//   print('Operand List: $operandList');
//   print('Operator List: $operatorList');
//   for (var i = 0; i < operatorList.length; i++) {
//     if (i == 0) {
//       operatorStack.push(element: operatorList[i]);
//       resultantList.add(operandList[i]);
//       resultantList.add(operandList[i + 1]);
//       print('Stack = ${operatorStack.peek()}');
//     } else {
//       while (((precedence(operator: operatorList[i])) <=
//           precedence(operator: operatorStack.peek().toString()))) {
//         String poppedOperator = operatorStack.pop().toString();
//         resultantList.add(poppedOperator);
//       }
//       operatorStack.push(element: operatorList[i]);
//       resultantList.add(operandList[i + 1]);
//     }
//   }
//   while ((operatorStack.peek() != -1)) {
//     dynamic poppedOperator = operatorStack.pop();

//     resultantList.add(poppedOperator);
//   }

//   print('Resultant List = $resultantList');
//   Stack<dynamic> calculationStack = Stack<dynamic>(size: expression.length);
//   for (var item in resultantList) {
//     if (item == '+' || item == '-' || item == '*' || item == '/') {
//       num poppedTwo = calculationStack.pop();
//       num poppedOne = calculationStack.pop();
//       print('PoppedOne = $poppedOne');
//       print('PoppedTwo = $poppedTwo');
//       calculationStack.push(
//           element:
//               calculate(first: poppedOne, second: poppedTwo, operator: item));
//     } else {
//       calculationStack.push(element: item);
//     }
//   }
//   print(calculationStack.peek());
// }

// int precedence({required String operator}) {
//   if (operator == '/' || operator == '*') {
//     return 2;
//   } else if (operator == '+' || operator == '-') {
//     return 1;
//   } else {
//     return -1;
//   }
// }

// num calculate(
//     {required num first, required num second, required String operator}) {
//   if (operator == '+') {
//     return first + second;
//   } else if (operator == '-') {
//     return first - second;
//   } else if (operator == '*') {
//     return first * second;
//   } else {
//     return first / second;
//   }
