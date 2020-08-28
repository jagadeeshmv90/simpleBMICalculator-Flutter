import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.selector, @required this.child});
  final Color colour;
  final Function selector;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selector,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              spreadRadius: 3.0,
              blurRadius: 0.25,
              color: kDarkTextColor,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
