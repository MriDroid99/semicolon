import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/task.dart';

class TaskWidget extends StatelessWidget {
  final String id, title;
  final DateTime date;
  final TimeOfDay time;
  final Status? status;
  final Function removeTask;
  const TaskWidget(this.id, this.title, this.date, this.time, this.removeTask,
      {Key? key, this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.indigoAccent,
            child: FittedBox(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(time.format(context)),
            )),
            // foregroundColor: Colors.white,
          ),
          title: Text(title),
          subtitle: Text(DateFormat.yMMMd().format(date)),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => removeTask(),
        ),
        IconSlideAction(
          caption: 'Archived',
          color: Colors.black45,
          icon: Icons.archive,
          onTap: () => print('Archived'),
        ),
        IconSlideAction(
          caption: 'Done',
          color: Colors.blue,
          icon: Icons.done_all,
          onTap: () => print('Done'),
        ),
      ],
    );
    ;
  }
}
