import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeColor = Color(0XFFEB1555);
const inActiveCardColor = Color(0xff111328);
const bottonContainerColor = Color(0XFFEB1555);

enum Gender { male, female }

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
                  child: GestureDetector(
                    onTap: () {
                      updateColor(Gender.male);
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(Gender.female);
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      colour: femaleCardColor,
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$displayHeight',
                        style: TextStyle(fontSize: 40.0),
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
                    max: 200,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value.round().toDouble();
                        displayHeight = value.toInt();
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
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottonContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
