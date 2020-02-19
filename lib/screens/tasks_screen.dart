import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class Task {
  final String task;
  final bool isComplete;

  const Task(this.task, this.isComplete);
}

final List<Task> _taskList = [
  new Task("Call Tom about appointment", false),
  new Task("Fix onboarding experience", false),
  new Task("Edit API documentation", false),
  new Task("Setup user focus group", false),
  new Task('Send project details to client', false),
  new Task("Have coffe with Sam", true),
  new Task("Meet with sales", true)
];

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isComplete
            ? _taskComplete(_taskList[index].task)
            : _taskUncomplete(_taskList[index].task);
      },
    );
  }

  Widget _taskUncomplete(String task) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.radio_button_unchecked,
                color: Theme.of(context).accentColor),
            SizedBox(width: 10),
            Text(task)
          ],
        ));
  }

  Widget _taskComplete(String task) {
    return Container(
        foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 24.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.radio_button_checked,
                    color: Theme.of(context).accentColor),
                SizedBox(width: 10),
                Text(task)
              ],
            )));
  }
}
