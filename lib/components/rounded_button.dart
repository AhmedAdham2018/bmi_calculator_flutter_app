import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundedButton({@required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
        elevation: 0.0,
        fillColor: Color(0x66FF5722),
        onPressed: onPressed);
  }
}
