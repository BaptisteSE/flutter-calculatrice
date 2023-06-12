import '../models/CalculatorModel.dart';

class CalculatorController {
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  String get output => _output;
  String get previousCalculation => _calculatorModel.previousCalculation;

  final CalculatorModel _calculatorModel = CalculatorModel();

  void buttonPressed(String buttonText) {
    _output = _calculatorModel.calculate(buttonText, _output);
  }
}
