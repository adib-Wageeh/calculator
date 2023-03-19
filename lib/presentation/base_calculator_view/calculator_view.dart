import 'package:calculator/presentation/base_calculator_view/widgets/row_of_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/calculator_services.dart';
import '../../domain/IconClass.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<List<IconProperties>> _list =[
      [IconProperties(iconTextColor: Colors.white70,iconWidth:screenWidth*0.22,iconText: "AC"),
        IconProperties(iconTextColor: Colors.white70,iconWidth:screenWidth*0.22,iconText: "-" ),
        IconProperties(iconTextColor: Colors.white70,iconWidth:screenWidth*0.22,iconText: "%" ),
        IconProperties(iconTextColor: Colors.orange,iconWidth:screenWidth*0.22,iconText: "/" )],

      [IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "7"),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "8" ),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "9" ),
        IconProperties(iconTextColor: Colors.orange,iconWidth:screenWidth*0.22,iconText: "*" )],

      [IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "4"),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "5" ),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "6" ),
        IconProperties(iconTextColor: Colors.orange,iconWidth:screenWidth*0.22,iconText: "_" )],

      [IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "1"),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "2" ),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "3" ),
        IconProperties(iconTextColor: Colors.orange,iconWidth:screenWidth*0.22,iconText: "+" )],

      [IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.464,iconText: "0"),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "." ),
        IconProperties(iconTextColor: Colors.white,iconWidth:screenWidth*0.22,iconText: "=" )
        ]
    ];
    return Scaffold(

      body: Consumer<CalculatorServices>(
        builder: (context,calServices,child){

          return Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight*0.34,
              ),
              ..._list.map((rowOfIcons) {
                return Column(
                  children: [
                    RowOfIcons(iconsData: rowOfIcons,),
                    SizedBox(height: screenHeight*0.01,)
                  ],
                );
              } ).toList()
            ],
          );
        },

      ),
    );
  }
}
