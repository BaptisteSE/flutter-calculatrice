import 'package:app_flutter/views/CalculatorView.dart';
import 'package:flutter/material.dart';

import 'controllers/CalculatorController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  CalculatorController calculatorController = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return CalculatorView(
      output: calculatorController.output,
      previousCalculation: calculatorController.previousCalculation,
      onButtonPressed: (String buttonText) {
        // Mise à jour de l'affichage
        setState(() {
          calculatorController.buttonPressed(buttonText);
        });
      },
    );
  }
}
