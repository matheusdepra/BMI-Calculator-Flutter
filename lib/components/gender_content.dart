import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/constants.dart';

class genderContent extends StatelessWidget {
  genderContent({@required this.gender, @required this.genderIcon});

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: labelTextStyle,
        )
      ],
    );
  }
}
