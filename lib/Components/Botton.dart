import 'package:flutter/material.dart';
import '../Constant.dart';

class Botton extends StatelessWidget {

  final VoidCallback onPrees;
  final text;

  const Botton({
    required this.text,required this.onPrees
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 27),
      child: TextButton(
        child: Text(text, style: AppStyles.buttonTextStyle),
        onPressed:onPrees,
      ),
    );
  }
}