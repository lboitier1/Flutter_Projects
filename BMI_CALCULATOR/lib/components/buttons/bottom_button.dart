import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({Key key, @required this.content, @required this.onPress}) : super(key: key);
  final Function onPress;
  String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomAppBarColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(content, style: kLargeButtonTextStyle),
        ),
      ),
    );
  }
}
