import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widget/task_widget.dart';

class TasksScreen extends StatefulWidget {
  final List<Task> tasks;
  final Function(String id) removeTask;
  const TasksScreen(this.tasks, this.removeTask, {Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) => TaskWidget(
        widget.tasks[i].id,
        widget.tasks[i].title,
        widget.tasks[i].date,
        widget.tasks[i].time,
        () {
          setState(() {
            widget.removeTask(widget.tasks[i].id);
          });
        },
      ),
      separatorBuilder: (ctx, i) => const Divider(
        thickness: 1.5,
      ),
      itemCount: widget.tasks.length,
    );
  }
}
