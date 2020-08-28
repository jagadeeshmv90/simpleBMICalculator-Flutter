import 'package:flutter/material.dart';
import 'app_screens/main_app_screen.dart';
import 'app_screens/result_screen.dart';
void main(){
  runApp(MaterialApp(
    theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color(0xff280b17),
    ),
    routes: {
      '/': (context) => MainAppScreen(),
      '/result': (context) => ResultScreen(),
    },
    initialRoute: '/',
  ));
}