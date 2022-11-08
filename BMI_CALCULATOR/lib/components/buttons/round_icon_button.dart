import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({Key key, this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}