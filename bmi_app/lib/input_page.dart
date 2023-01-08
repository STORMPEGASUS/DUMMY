import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'iconContent.dart';
import 'reusable_card.dart';

const activecolor = Color(0xFF1D1F33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF090C22),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    colour: activecolor,
                    cardChild: iconContent(
                        gender: "MALE", icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    colour: activecolor,
                    cardChild: iconContent(
                        gender: "FEMALE", icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Reusablecard(colour: activecolor)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: Reusablecard(colour: activecolor)),
                Expanded(child: Reusablecard(colour: activecolor))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Color(0xFFEB1555),
            height: 80,
          )
        ],
      ),
    );
  }
}
