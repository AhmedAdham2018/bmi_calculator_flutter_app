import 'package:bmi_calculator_flutter_app/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String contentText;
  final IconData contentIcon;

  IconContent({@required this.contentIcon, this.contentText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          contentIcon,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          contentText,
          style: kTextStyle,
        )
      ],
    );
  }
}
