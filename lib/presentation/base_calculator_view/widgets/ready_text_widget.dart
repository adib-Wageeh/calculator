import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/calculator_services.dart';

class ReadyTextWidget extends StatelessWidget {

  double widgetHeight;
  double widgetWidth;
  ReadyTextWidget({required this.widgetHeight,required this.widgetWidth,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CalculatorServices state = Provider.of<CalculatorServices>(context);
    return Row(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: (state.getErrorState)? 1:0,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 80,
              height: widgetHeight*0.20,
              child: const Text("Error",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: widgetWidth*0.05),
            alignment: Alignment.centerRight,
            height: widgetHeight*0.20,
            width: double.infinity,
            child: FittedBox(
              child:
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: (state.getErrorState)? 0:1,
                    child: SelectableText(
                        state.getReadyNumber,
                        style: const TextStyle(fontSize: 36,fontWeight: FontWeight.w200)),
                  ),
            ),
          ),
        ),
      ],
    );;
  }
}
