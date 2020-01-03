import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;
  Gender selectedGender;
  double height = 183;
  int displayHeight = 183;
  int weight = 60;
  int age = 20;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == inActiveCardColor) {
        setState(() {
          maleCardColor = activeColor;
          femaleCardColor = inActiveCardColor;
          selectedGender = Gender.male;
        });
      }
    } else {
      if (femaleCardColor == inActiveCardColor) {
        setState(() {
          femaleCardColor = activeColor;
          maleCardColor = inActiveCardColor;
          selectedGender = Gender.female;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      updateColor(Gender.male);
                    },
                    colour: maleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      updateColor(Gender.female);
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    colour: femaleCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: inActiveCardColor,
              cardChild: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$displayHeight',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        ' cm',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
                      )
                    ],
                  ),
                  Slider(
                    activeColor: activeColor,
                    min: 100,
                    max: 220,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value.round().toDouble();
                        displayHeight = value.toInt() + 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff8d8e98)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff8d8e98)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Gender: $selectedGender');
              print('Height: $displayHeight');
              print('Weight $weight');
              print('Age: $age');
            },
            child: Container(
              color: bottonContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Function onPress;
  RoundedButton({this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
