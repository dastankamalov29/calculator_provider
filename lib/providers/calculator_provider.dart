import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  String _displayText = "0";
  String get displayText => _displayText;

  void setValue(String value) {
    if (displayText == "0" && value != "=") {
      _displayText = value;
    } else {
      switch (value) {
        //Function for "AC" clear all express
        case "AC":
          _displayText = "0";
          break;
        //function for multiply operation
        case "x":
          _displayText += "*";
          break;
        //for  = operation
        case "=":
          calculate();
          break;
        default:
          _displayText += value;
      }
    }
    notifyListeners();
  }

  void calculate() {
    try {
      String expresion = _displayText.replaceAll("x", "*");
      num result = expresion.interpret();
      _displayText = result == result.toInt()
          ? result.toInt().toString()
          : result.toString();
    } catch (e) {
      _displayText = "Error";
    }
    notifyListeners();
  }
}
