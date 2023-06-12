import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  final String output;
  final String previousCalculation;
  final Function(String) onButtonPressed;

  CalculatorView({
    required this.output,
    required this.previousCalculation,
    required this.onButtonPressed,
  });

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculatrice',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.blueGrey : Colors.white,
      ),
      body: Container(
        color: isDarkMode ? Color.fromARGB(255, 46, 46, 46) : Colors.white,
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
                    widget.previousCalculation,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    widget.output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey),
                    buildButton("8", Colors.grey),
                    buildButton("9", Colors.grey),
                    buildButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey),
                    buildButton("5", Colors.grey),
                    buildButton("6", Colors.grey),
                    buildButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey),
                    buildButton("2", Colors.grey),
                    buildButton("3", Colors.grey),
                    buildButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey),
                    buildButton("0", Colors.grey),
                    buildButton("00", Colors.grey),
                    buildButton("+", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("CLEAR", Colors.red),
                    buildButton("=", Colors.green),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text(
                    isDarkMode ? "Mode Blanc" : "Mode Sombre",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
        onPressed: () => widget.onButtonPressed(buttonText),
      ),
    );
  }
}
