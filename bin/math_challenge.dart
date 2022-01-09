import 'package:math_expressions/math_expressions.dart';

void main() {
  print(mathChallenge('4-2=x'));
}

String mathChallenge(String str) {
  final String copyStr = str;
  late String missingDigit;

  try {
    for (var i = 0; i <= 9; i++) {
      //replace "x" with a number
      final replaceX = copyStr.replaceAll(RegExp("x"), i.toString());

      //separate formula from the equals sign
      final splitEqual = replaceX.split("=");
      final afterEqualSign = int.parse(splitEqual[1]);
      final beforeEqualSign = splitEqual[0];

      Parser p = Parser();
      double evaluateBeforeEqualSign = p.parse(beforeEqualSign).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );

      if (evaluateBeforeEqualSign == afterEqualSign) {
        missingDigit = i.toString();
      }
    }
    if (missingDigit.isNotEmpty) {
      return missingDigit;
    }
  } catch (e) {
    return missingDigit = "ERROR";
  }
  return missingDigit;
}
