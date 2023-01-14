import 'package:flutter/material.dart';

import 'constant.dart';



class iconContent extends StatelessWidget {
  final String gender;
  final IconData icon;
  iconContent({this.gender, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          "$gender",
          style: labelTextstyle,
        )
      ],
    );
  }
}