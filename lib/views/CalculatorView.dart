import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  final String output;
  final String previousCalculation;
  final Function(String) onButtonPressed;

  CalculatorView({
    required this.output,
    required this.previousCalculation,
    required this.onButtonPressed,
  });

  // Fonction pour construire l'interface utilisateur
  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          side: BorderSide(width: 2, color: Colors.white),
          backgroundColor: color,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => onButtonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    previousCalculation,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    output, // Affichage de la sortie
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                // Création des rangées de boutons
                Row(children: [
                  buildButton("7", Colors.grey),
                  buildButton("8", Colors.grey),
                  buildButton("9", Colors.grey),
                  buildButton("/", Colors.orange)
                ]),
                Row(children: [
                  buildButton("4", Colors.grey),
                  buildButton("5", Colors.grey),
                  buildButton("6", Colors.grey),
                  buildButton("*", Colors.orange)
                ]),
                Row(children: [
                  buildButton("1", Colors.grey),
                  buildButton("2", Colors.grey),
                  buildButton("3", Colors.grey),
                  buildButton("-", Colors.orange)
                ]),
                Row(children: [
                  buildButton(".", Colors.grey),
                  buildButton("0", Colors.grey),
                  buildButton("00", Colors.grey),
                  buildButton("+", Colors.orange)
                ]),
                Row(children: [
                  buildButton("CLEAR", Colors.red),
                  buildButton("=", Colors.green),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
