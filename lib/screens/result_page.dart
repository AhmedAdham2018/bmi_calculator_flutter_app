import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_app/components/reusable_card.dart';
import 'package:bmi_calculator_flutter_app/constants.dart';
import 'package:bmi_calculator_flutter_app/components/bottom_calculator_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretationResult;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretationResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR SCORE: ',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              color: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  Text(bmiResult, style: kBmiTextStyle),
                  Text(interpretationResult,
                      textAlign: TextAlign.center, style: kRecommendTextStyle)
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomCalculatorButton(
                buttonTitle: 'Re-Calculate',
                onTap: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
