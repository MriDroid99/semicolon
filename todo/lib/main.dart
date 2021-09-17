import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task.dart';
import 'package:todo/screen/add_task_screen.dart';
import 'package:todo/screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Tasks(),
      child: MaterialApp(
        // home: const TabScreen(),
        routes: {
          '/': (_) => const TabScreen(),
          '/add_task_screen': (_) => const AddTaskScreen(),
        },
      ),
    );
  }
}
