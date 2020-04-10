import 'package:flutter/material.dart';
import 'results_page.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonText});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomCardColour,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomAppBarHeight,
        margin: EdgeInsets.only(top: 15),
      ),
    );
  }
}
