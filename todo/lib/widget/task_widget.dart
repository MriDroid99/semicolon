import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task.dart';

class TaskWidget extends StatelessWidget {
  final String id, title;
  final DateTime date;
  final TimeOfDay time;
  final Status? status;
  const TaskWidget(this.id, this.title, this.date, this.time,
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
          onTap: () =>
              Provider.of<Tasks>(context, listen: false).removeTask(id),
        ),
        IconSlideAction(
          caption: status == Status.archived ? 'Unarchived' : 'Archived',
          color: Colors.black45,
          icon: Icons.archive,
          onTap: () => Provider.of<Tasks>(context, listen: false).toggleStatus(
              id, status == Status.archived ? null : Status.archived),
        ),
        if (status != Status.done)
          IconSlideAction(
            caption: 'Done',
            color: Colors.blue,
            icon: Icons.done_all,
            onTap: () => Provider.of<Tasks>(context, listen: false)
                .toggleStatus(id, Status.done),
          ),
      ],
    );
    ;
  }
}
