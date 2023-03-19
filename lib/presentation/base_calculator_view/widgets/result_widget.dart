import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/calculator_services.dart';

class ResultWidget extends StatelessWidget {

  double widgetHeight;
  double widgetWidth;
  ResultWidget({required this.widgetHeight,required this.widgetWidth,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widgetWidth*0.05),
      alignment: Alignment.centerRight,
      height: widgetHeight*0.33,
      width: double.infinity,
      child: (Text(Provider.of<CalculatorServices>(context).getNumber.toString(),style: const TextStyle(fontSize: 48,fontWeight: FontWeight.w400))),
    );
  }
}
