import 'package:MyBMICalculator/assets/icons.dart';
import 'package:MyBMICalculator/assets/reusable_card.dart';
import 'package:flutter/material.dart';
import '../assets/constants.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({this.bmi, this.bmiResults, this.bmiOpinion});
  final String bmi;
  final String bmiResults;
  final String bmiOpinion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          title: Center(
            child: Text(
              'BMI CALCULATOR 1.0',
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'YOUR RESULTS!',
                style: kBigLabelStyle.copyWith(
                    color: Colors.white, fontSize: 25.0),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kCardBackgroundColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiResults, style: kResultLabelStyle, textAlign: TextAlign.center,
                        ),
                        Text(
                          'Your BMI is $bmi ', style: kBigLabelStyle,textAlign: TextAlign.center,
                        ),
                        Text(
                         bmiOpinion, style: kInterpretationLabelStyle,textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: ReusableFloatingButton(
                child: Icons.keyboard_backspace,
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            )
          ],
        ));
  }
}
