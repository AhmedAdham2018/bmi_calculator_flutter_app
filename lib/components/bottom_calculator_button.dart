import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_app/constants.dart';

class BottomCalculatorButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  BottomCalculatorButton({@required this.buttonTitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kBigTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
      ),
    );
  }
}
