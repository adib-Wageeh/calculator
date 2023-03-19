import 'package:flutter/material.dart';

import '../../../domain/IconClass.dart';

class IconWidget extends StatelessWidget {

  IconProperties iconData;
  IconWidget({required this.iconData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width:iconData.iconWidth,
      height: screenSize.height*0.12,
      decoration: BoxDecoration(
      color: const Color.fromARGB(255,42,50,69)
      ,borderRadius: BorderRadius.circular(15),
      //    boxShadow: const [BoxShadow(color: Colors.grey)]
      ),
      child: Center(
        child: Text(iconData.iconText,style: TextStyle(color: iconData.iconTextColor,fontSize: 26,fontWeight: FontWeight.bold)),
      ),
    );
  }
}
