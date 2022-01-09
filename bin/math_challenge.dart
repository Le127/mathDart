import 'package:math_expressions/math_expressions.dart';

void main() {
  print(mathChallenge('1x - 6 = 4'));
}

String mathChallenge(String str) {
  final String copyStr = str;
  late String missingDigit;

  try {
    for (var i = 0; i <= 9; i++) {
      //replace "x" with a number
      final String replaceX = copyStr.replaceAll(RegExp("x"), i.toString());

      //separate formula from the equals sign
      final List<String> splitEqual = replaceX.split("=");
      final int afterEqualSign = int.parse(splitEqual[1]);
      final String beforeEqualSign = splitEqual[0];

      //evaluates the formula before the equals sign
      Parser p = Parser();
      double evaluateBeforeEqualSign = p.parse(beforeEqualSign).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );
        
      if (evaluateBeforeEqualSign == afterEqualSign) {
        return missingDigit = i.toString();
      }
    }
     //If it found equality between evaluateBeforeEqualSign and afterEqualSign it returns i, otherwise "ERROR"
    if (missingDigit.isNotEmpty) {
      return missingDigit;
    }
  } catch (e) {
    return missingDigit = "ERROR";
  }

  return missingDigit;
}
