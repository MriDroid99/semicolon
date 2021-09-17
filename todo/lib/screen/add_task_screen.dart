import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Task',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: timeController,
                    readOnly: true,
                    onTap: () async {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      setState(() {
                        timeController.text = selectedTime?.format(context) ??
                            TimeOfDay.now().format(context);
                      });
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.timer),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                          2020,
                        ),
                        lastDate: DateTime.now().add(
                          const Duration(days: 7),
                        ),
                      );
                      setState(() {
                        dateController.text = DateFormat.yMMMd()
                            .format(selectedDate ?? DateTime.now());
                      });
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Tasks>(context, listen: false).addTask(
                      titleController.text,
                      selectedDate ?? DateTime.now(),
                      selectedTime ?? TimeOfDay.now());
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 50,
                  ),
                ),
                child: const Text(
                  'Add Task',
                ))
          ],
        ),
      ),
    );
  }
}
