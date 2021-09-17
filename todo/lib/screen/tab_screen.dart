import 'package:flutter/material.dart';
import 'package:todo/provider/task.dart';
import 'package:todo/screen/archived_screen.dart';
import 'package:todo/screen/done_screen.dart';
import 'package:todo/screen/tasks_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Tasks',
        'body': const TasksScreen(),
      },
      {
        'title': 'Archived',
        'body': const ArchivedScreen(),
      },
      {
        'title': 'Done',
        'body': const DoneScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
      ),
      body: _pages[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: changeIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Done',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task_screen');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
