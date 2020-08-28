import 'package:MyBMICalculator/assets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MyBMICalculator/main.dart';
import 'package:MyBMICalculator/app_screens/main_app_screen.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon({this.onPressed, this.colour, this.iCon});
  final Function onPressed;
  final Color colour;
  final IconData iCon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(iCon),
    iconSize: 56.0,
    color: colour,
    onPressed: onPressed,
    );
  }
}

class ReusableFloatingButton extends StatelessWidget{
  ReusableFloatingButton({this.onPressed, this.child, this.backgroundColor});
  final Function onPressed;
  final IconData child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      splashColor: kDarkIconColor,
        onPressed: onPressed,
        child: Icon(
          child,
          color: kCardBackgroundColor,
          size: 56.0,
        ),
        backgroundColor: kDarkIconColor,
    );
  }
}