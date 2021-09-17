import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task.dart';
import 'package:todo/widget/task_widget.dart';

// class TasksScreen extends StatefulWidget {
//   const TasksScreen({Key? key}) : super(key: key);

//   @override
//   State<TasksScreen> createState() => _TasksScreenState();
// }

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<Tasks>(context).tasks(Status.done);
    return ListView.separated(
      itemBuilder: (ctx, i) => TaskWidget(
        tasks[i].id,
        tasks[i].title,
        tasks[i].date,
        tasks[i].time,
        status: tasks[i].status,
      ),
      separatorBuilder: (ctx, i) => const Divider(
        thickness: 1.5,
      ),
      itemCount: tasks.length,
    );
  }
}
