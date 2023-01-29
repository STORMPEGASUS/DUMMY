import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class Results_page extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String interpreation;
  Results_page({this.bmiresult, this.resulttext, this.interpreation});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: titletextstyle,
              ),
            ),
          ),
          Expanded(
            child: Reusablecard(
              colour: activecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext.toUpperCase(),
                    style: resulttext_style,
                  ),
                  Text(
                    bmiresult,
                    style: bmitextstyle,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Normal BMI range:",
                          style: resultbodytext_2,
                        ),
                        Text(
                          "18.5 - 25 kg/m2",
                          style: resultbodytext,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    interpreation,
                    style: resultbodytext,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            flex: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'RE-CALCULATE',
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
