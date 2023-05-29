class Task {
  final String name;
  bool isdone;

  Task({required this.name, this.isdone = false});

  void toggleDone() {
    isdone = !isdone;
  }
}
