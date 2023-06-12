import '../models/CalculatorModel.dart';

class CalculatorController {
  // La variable privée _output représente la sortie de la calculatrice
  String _output = "0";

  // Getter pour obtenir la valeur actuelle de la sortie
  String get output => _output;

  // Getter pour obtenir le calcul précédent à afficher
  String get previousCalculation => _calculatorModel.previousCalculation;

  // Instance du modèle de la calculatrice
  final CalculatorModel _calculatorModel = CalculatorModel();

  // Méthode pour gérer l'appui sur un bouton
  void buttonPressed(String buttonText) {
    // Appeler la méthode calculate du modèle avec le texte du bouton et la sortie actuelle comme arguments
    _output = _calculatorModel.calculate(buttonText, _output);
  }
}
