import 'package:flutter/material.dart'
;import 'package:math_expressions/math_expressions.dart';

class CalculatorServices extends ChangeNotifier{

  // final result
  String _finalNumber="";
  bool _error = false;

  //result before pressing equal sign
  String _readyNumber="";

  ContextModel context = ContextModel();
  Parser p = Parser();

  String get getNumber=>_finalNumber;
  String get getReadyNumber=>_readyNumber;
  bool get getErrorState=>_error;

  // when pressing Equal sign
  void changeFinalNumber(String newExpression){
    try {
      Expression exp = p.parse(newExpression);
      String res = exp.evaluate(EvaluationType.REAL, context);
      if (res == "Infinity" || res == "NaN" || res.toString() == "-Infinity") {
        _error = true;
        notifyListeners();
      } else {
        _finalNumber = res;
        _readyNumber = "";
      }
    }catch(e){
      debugPrint(e.toString());
    }

  }

//when pressing any number or operation
  void addNum(String num){

    if( checkPosition(num) ==true) {
      _finalNumber = _finalNumber + num;
      changeReadyNumber(_finalNumber);
      notifyListeners();
    }

  }

  void changeReadyNumber(String newExpression){
    try {
      Expression exp = p.parse(newExpression);
      double res = exp.evaluate(EvaluationType.REAL, context);
      if (res.toString() == "Infinity" || res.toString() == "NaN"|| res.toString() == "-Infinity") {
        _error = true;
      } else {
          _readyNumber = res.toString();
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  // when pressing AC
  void setToZero(){
    _finalNumber = "";
    _readyNumber = "";
    _error=false;
    notifyListeners();
  }


  // checks if multible operations after each other
  bool checkPosition(String num){

    if( (num =="*")||(num =="/")||(num =="+")||(num =="-")||(num =="%") ){

      if( _finalNumber == "" || _finalNumber.endsWith("*") || _finalNumber.endsWith("/") || _finalNumber.endsWith("+") || _finalNumber.endsWith("%") || _finalNumber.endsWith("-")) {
        return false;
      }
    }

      return true;
  }


  void removeLastItem(){

    if(_finalNumber != "") {
      _finalNumber = _finalNumber.substring(0, _finalNumber.length-1);
      if(_finalNumber == "")
        {
          _readyNumber = "";
        }
      else {
        changeReadyNumber(_finalNumber);
      }
      notifyListeners();
    }
  }

}