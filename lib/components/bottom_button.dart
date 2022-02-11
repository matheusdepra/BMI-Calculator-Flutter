import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  
  BottomButton({ @required this.onPress, @required this.buttonTitle });

  final Function onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: kLargeBtnTextStyle,
          ),
        ),
        color: btnBgd,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
