// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/task_data.dart';

import 'Task_Tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              ischeck: taskData.tasks[index].isdone,
              title: taskData.tasks[index].name,
              checkBoxCallback: (bool? checkboxstate) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longpresscallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
