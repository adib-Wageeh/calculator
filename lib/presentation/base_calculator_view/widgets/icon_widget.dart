import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/calculator_services.dart';
import '../../../domain/IconClass.dart';

class IconWidget extends StatelessWidget {

  IconProperties iconData;
  IconWidget({required this.iconData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width:iconData.iconWidth,
      height: screenSize.height*0.11,
      decoration: BoxDecoration(
      color: const Color.fromARGB(255,42,50,69)
      ,borderRadius: BorderRadius.circular(15),
        boxShadow:[ BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            onPressed(context,iconData.iconText);
          },
          focusColor: Colors.grey[100],
          splashColor: Colors.transparent,
          child: Center(
            child: Text(iconData.iconText,style: TextStyle(color: iconData.iconTextColor,fontSize: 26,fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context,String word){

    switch(word){

      case "AC":
        Provider.of<CalculatorServices>(context,listen: false).setToZero();
        break;
      case "<=":
        Provider.of<CalculatorServices>(context,listen: false).removeLastItem();
        break;
      case "=":
        Provider.of<CalculatorServices>(context,listen: false).pressedEqualSign();
        break;
      default:
        Provider.of<CalculatorServices>(context,listen: false).addNum(word);
        break;

    }
  }

}
