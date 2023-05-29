import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Shoes'),
    Task(name: 'Buy Car'),
    Task(name: 'Buy Food'),
  ];

  void addTask(String tasktitle) {
    final task = Task(name: tasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskcount {
    return _tasks.length;
  }

  void updateTask(Task tasks) {
    tasks.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
