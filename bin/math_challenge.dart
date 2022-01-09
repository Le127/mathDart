import 'package:math_expressions/math_expressions.dart';

void main() {
  print(mathChallenge('4-x=2'));
}

//receives a string with a mathematical formula where one digit is replaced by an "x". Returns the missing digit.
//If the input is wrong, throws an exception.
String mathChallenge(String str) {
  for (var i = 0; i <= 9; i++) {
    //replace "x" with a number
    final String replaceX = str.replaceAll(RegExp("x"), i.toString());

    //separate formula from the equals sign
    final List<String> splitEqual = replaceX.split("=");
    if (splitEqual.length != 2) {
      throw "Not an equation";
    }
    final int afterEqualSign = int.parse(splitEqual[1]);
    final String beforeEqualSign = splitEqual[0];

    //evaluates the formula before the equals sign
    Parser p = Parser();
    double evaluateBeforeEqualSign = p.parse(beforeEqualSign).evaluate(
          EvaluationType.REAL,
          ContextModel(),
        );

    if (evaluateBeforeEqualSign == afterEqualSign) {
      return i.toString();
    }
  }

  throw "Invalid equation";
}