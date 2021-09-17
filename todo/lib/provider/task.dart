import 'package:flutter/material.dart';

enum Status { archived, done }

class Task {
  String id, title;
  DateTime date;
  TimeOfDay time;
  Status? status;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    this.status,
  });
}

class Tasks with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Title 1',
      date: DateTime.now(),
      time: TimeOfDay.now(),
    ),
    Task(
        id: '2',
        title: 'Title 2',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        status: Status.done),
  ];

  List<Task> tasks(Status? status) =>
      _tasks.where((element) => element.status == status).toList();

  void toggleStatus(String id, Status? status) {
    _tasks.firstWhere((element) => element.id == id).status = status;
    notifyListeners();
  }

  void addTask(String title, DateTime date, TimeOfDay time) {
    _tasks.add(
      Task(
        id: DateTime.now().toString(),
        title: title,
        date: date,
        time: time,
      ),
    );
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
