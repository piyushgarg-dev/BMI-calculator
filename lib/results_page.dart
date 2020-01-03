import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpetion;

  ResultsPage({this.bmiResult, this.resultText, this.interpetion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: inActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpetion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTile: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
