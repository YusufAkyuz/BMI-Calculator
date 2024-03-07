import 'package:flutter/material.dart';

class IconClass extends StatelessWidget {
  const IconClass({
    required this.icon,
    required this.nameIcon
  });

  final IconData icon;
  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 140,color: Colors.white,),
        SizedBox(height: 15,),
        Text(nameIcon,style: TextStyle(
            fontSize: 18,
            color: Colors.white
        ),)
      ],
    );
  }
}