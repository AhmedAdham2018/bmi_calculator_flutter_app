import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter_app/components/reusable_card.dart';
import 'package:bmi_calculator_flutter_app/components/bottom_calculator_button.dart';
import 'package:bmi_calculator_flutter_app/components/icon_content.dart';
import 'package:bmi_calculator_flutter_app/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator_flutter_app/components/rounded_button.dart';
import 'package:bmi_calculator_flutter_app/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 165;
  int age = 22;
  int weight = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressedCard: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      contentIcon: FontAwesomeIcons.mars,
                      contentText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressedCard: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      contentIcon: FontAwesomeIcons.venus,
                      contentText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveReusableCardColor,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                      thumbColor: Color(0xFFFF5722),
                      overlayColor: Color(0x29FF5722),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF9e9e9e),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        max: 250.0,
                        min: 50.0,
                        onChanged: (double newHeightValue) {
                          setState(() {
                            height = newHeightValue.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kTextStyle),
                        Text(age.toString(), style: kBigTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            SizedBox(width: 10.0),
                            RoundedButton(
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                    color: kActiveReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kTextStyle),
                        Text(weight.toString(), style: kBigTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            SizedBox(width: 10.0),
                            RoundedButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomCalculatorButton(
              buttonTitle: 'Calculate',
              onTap: () {
                CalculatorBrain calculator =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculator.calculateBMI(),
                      resultText: calculator.getResult(),
                      interpretationResult: calculator.getInterpretation(),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
