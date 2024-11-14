import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0'; // Displayed value
  String _currentInput = ''; // Current input string
  String _operator = ''; // Current operator
  double _firstOperand = 0; // First operand
  bool _isOperatorSet = false; // Flag to indicate if an operator has been set

  void _inputNumber(String number) {
    setState(() {
      if (_display == '0' || _isOperatorSet) {
        _display = number;
        _isOperatorSet = false;
      } else {
        _display += number;
      }
      _currentInput = _display;
    });
  }

  void _setOperator(String operator) {
    setState(() {
      _firstOperand = double.parse(_currentInput);
      _operator = operator;
      _isOperatorSet = true;
    });
  }

  void _calculateResult() {
    setState(() {
      double secondOperand = double.parse(_display);
      double result;

      switch (_operator) {
        case '+':
          result = _firstOperand + secondOperand;
          break;
        case '-':
          result = _firstOperand - secondOperand;
          break;
        case '*':
          result = _firstOperand * secondOperand;
          break;
        case '/':
          result = secondOperand != 0 ? _firstOperand / secondOperand : double.nan;
          break;
        default:
          result = double.parse(_display);
      }

      _display = result.toString();
      _currentInput = '';
      _operator = '';
      _isOperatorSet = false;
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _currentInput = '';
      _firstOperand = 0;
      _operator = '';
      _isOperatorSet = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display screen
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          // Button Grid
          Expanded(
            child: Column(
              children: [
                _buildButtonRow(['7', '8', '9', '/']),
                _buildButtonRow(['4', '5', '6', '*']),
                _buildButtonRow(['1', '2', '3', '-']),
                _buildButtonRow(['C', '0', '=', '+']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create each row of buttons
  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _onButtonPressed(buttonText);
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Handle button actions
  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '=') {
      _calculateResult();
    } else if ('+-*/'.contains(buttonText)) {
      _setOperator(buttonText);
    } else {
      _inputNumber(buttonText);
    }
  }
}
