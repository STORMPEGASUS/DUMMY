import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'iconContent.dart';
import 'reusable_card.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected = null;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF090C22),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    onpress: () {
                      setState(() {
                        selected = Gender.Male;
                      });
                    },
                    colour:
                        selected == Gender.Male ? activecolor : inactivecolor,
                    cardChild: iconContent(
                        gender: "MALE", icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    onpress: () {
                      setState(() {
                        selected = Gender.Female;
                      });
                    },
                    colour:
                        selected == Gender.Female ? activecolor : inactivecolor,
                    cardChild: iconContent(
                        gender: "FEMALE", icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              colour: activecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numberStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 13,
                        )),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      //inactiveColor: Color(0xFF8D898),
                      onChanged: (double newheight) {
                        setState(() {
                          height = newheight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    colour: activecolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: labelTextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Round_button(
                              icon: FontAwesomeIcons.minus,
                              ontap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Round_button(
                              icon: FontAwesomeIcons.plus,
                              ontap: () {
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
                  child: Reusablecard(
                    colour: activecolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: labelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Round_button(
                              icon: FontAwesomeIcons.minus,
                              ontap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Round_button(
                                icon: FontAwesomeIcons.plus,
                                ontap: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results_page(
                    bmiresult: cal.calculate(),
                    resulttext: cal.Getresult(),
                    interpreation: cal.interpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                'CALCULATE BMI',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              )),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: Color(0xFFEB1555),
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}

class Round_button extends StatelessWidget {
  final IconData icon;
  final Function ontap;
  Round_button({@required this.icon, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 10,
      onPressed: ontap,
    );
  }
}
