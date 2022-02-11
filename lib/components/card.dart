import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  BMICard({@required this.cardColor, this.cardChild, this.onPress});

  final Color cardColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              // color: Color(0xFF1D1E33),
              color: cardColor,
              borderRadius: BorderRadius.circular(10.0))),
    );
  }
}