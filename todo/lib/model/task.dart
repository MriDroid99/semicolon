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
