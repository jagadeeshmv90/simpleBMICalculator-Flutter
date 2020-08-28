import 'package:MyBMICalculator/app_screens/result_screen.dart';
import 'package:MyBMICalculator/assets/bmi_brain.dart';
import 'package:MyBMICalculator/assets/icons.dart';
import 'package:MyBMICalculator/assets/reusable_card.dart';
import 'package:flutter/material.dart';
import '../assets/reusable_card.dart';
import '../assets/constants.dart';
import '../assets/icons.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int userHeight = 150;
  int userWeight = 60;
  int userAge = 25;
  double userBMI;

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
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kCardBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kSmallLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                userWeight.toString(),
                                style: kBigLabelStyle,
                              ),
                              Text(
                                'KG',
                                style: kSmallLabelStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableIcon(
                                iCon: Icons.remove_circle,
                                colour: kDarkIconColor,
                                onPressed: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                },
                              ),
                              ReusableIcon(
                                iCon: Icons.add_circle,
                                colour: kDarkIconColor,
                                onPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kCardBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'AGE',
                            style: kSmallLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                '25',
                                style: kBigLabelStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableIcon(
                                iCon: Icons.remove_circle,
                                colour: kDarkIconColor,
                                onPressed: () {
                                  setState(() {
                                    userAge--;
                                  });
                                },
                              ),
                              ReusableIcon(
                                colour: kDarkIconColor,
                                iCon: Icons.add_circle,
                                onPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: kCardBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Drag the Slider to Adjust Height in cms',
                    style: kSmallLabelStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kDarkIconColor,
                      inactiveTrackColor: kDarkIconColorFaded,
                      thumbColor: kDarkIconColor,
                      overlayColor: kDarkIconColorFaded,
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 22.0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 16.0),
                    ),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 100.0,
                      max: 200.0,
                      onChanged: (double value) {
                        setState(() {
                          userHeight = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kSmallLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              userHeight.toString(),
                              style: kBigLabelStyle,
                            ),
                            Text(
                              'cms',
                              style: kSmallLabelStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'SELECTED VALUES',
                          style: kSmallLabelStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Your Height: $userHeight cms',
                          style: kSmallLabelStyle,
                        ),
                        Text(
                          'Your Weight: $userWeight KG',
                          style: kSmallLabelStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReusableCard(child: ReusableFloatingButton(
                  child: Icons.play_circle_filled,
                  onPressed: () {
                    BMIBrain calc = BMIBrain(userHeight: userHeight, userWeight: userWeight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            bmi: calc.getBMI(),
                            bmiResults: calc.getResults(),
                            bmiOpinion: calc.getOpinion(),
                          ),
                        ));
                  },
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
