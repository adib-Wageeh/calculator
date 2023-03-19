import 'package:calculator/presentation/base_calculator_view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/calculator_services.dart';

  void main(){
    // ContextModel context = ContextModel();
    // Parser p = Parser();
    // Expression exp = p.parse('5 / 0');
    // print(exp.evaluate(EvaluationType.REAL,context));
    runApp(const MainView());


  }

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/CalculatorView":(context)=> const CalculatorView()

      },
      home:
      ChangeNotifierProvider(
        create: (context)=>CalculatorServices(),
        child: const CalculatorView(),
      )
      ,
    );
  }
}
