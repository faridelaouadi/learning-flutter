import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    this.child,
    this.onPress,
    this.border,
  });

  final Color colour;
  final Widget child;
  final Function onPress;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(15.0),
            border: border),
      ),
    );
  }
}
