class CalculatorModel {
  double? num1;
  double? num2;
  String? operand;
  String _previousCalculation = "";

  String calculate(String buttonText, String output) {
    String _output = output;

    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = null;
      num2 = null;
      operand = null;
      _previousCalculation = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      _previousCalculation += "$num1 $operand ";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Déjà contient un décimal");
        return _output;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      _previousCalculation += "$num2 = ";

      if (operand == "+") {
        _output = (num1! + num2!).toString();
      }
      if (operand == "-") {
        _output = (num1! - num2!).toString();
      }
      if (operand == "*") {
        _output = (num1! * num2!).toString();
      }
      if (operand == "/") {
        _output = (num1! / num2!).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    return _output;
  }

  String get previousCalculation => _previousCalculation;
}
