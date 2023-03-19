import 'package:flutter/material.dart'
;import 'package:math_expressions/math_expressions.dart';

class CalculatorServices extends ChangeNotifier{

  double _number=0;
  ContextModel context = ContextModel();
  Parser p = Parser();

  get getNumber=>_number;

  void changeNumber(String newExpression){

    Expression exp = p.parse(newExpression);
    String res = exp.evaluate(EvaluationType.REAL, context);
    if(res != "INFINITY"){
      _number = double.parse(res);
      notifyListeners();
    }else{

    }

  }

}