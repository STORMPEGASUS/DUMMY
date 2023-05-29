// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischeck;
  final String title;
  final void Function()? longpresscallback;
  final void Function(bool?)? checkBoxCallback;

  TaskTile({required this.ischeck, required this.title, this.checkBoxCallback,required this.longpresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longpresscallback,
      title: Text(
        title,
        style: TextStyle(
          decoration: ischeck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: ischeck,
        activeColor: Color.fromARGB(255, 90, 193, 252),
        //onChanged: toggleCheckboxstate,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
