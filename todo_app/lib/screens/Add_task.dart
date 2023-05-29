import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String textinput='';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              style: TextStyle(
                color: Color.fromARGB(255, 90, 193, 252),
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                textinput = newText;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(textinput);
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 90, 193, 252)),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
