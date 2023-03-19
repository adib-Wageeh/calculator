import 'package:flutter/material.dart';

import '../../../domain/IconClass.dart';
import 'icon_widget.dart';

class RowOfIcons extends StatelessWidget {


  List<IconProperties> iconsData;
  RowOfIcons({required this.iconsData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconsData.map((icon){

        return IconWidget(iconData: icon,);
      }).toList(),

    );
  }
}
