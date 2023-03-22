import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/calculator_services.dart';

class ResultWidget extends StatelessWidget {

  double widgetHeight;
  double widgetWidth;
  ResultWidget({required this.widgetHeight,required this.widgetWidth,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CalculatorServices cS = Provider.of<CalculatorServices>(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      bottom: cS.equalState? 20:0,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widgetWidth*0.05),
        alignment: Alignment.centerRight,
        height: widgetHeight*0.70,
        width: widgetWidth,
        child: FittedBox(
          child: (
          SelectableText(Provider.of<CalculatorServices>(context).getNumber.toString(),
              style: const TextStyle(fontSize: 64,fontWeight: FontWeight.w400))),
        ),
      ),
    );
  }
}
