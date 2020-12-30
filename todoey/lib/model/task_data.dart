import 'package:flutter/cupertino.dart';
import 'package:todoey/model/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [
    Task(title: 'Buy milk', isChecked: false),
    Task(title: 'Buy eggs', isChecked: false),
    Task(title: 'Buy bread', isChecked: false)
  ];

  int get taskCount => taskList.length;

  void toogle(int index, bool value) {
    taskList[index].isChecked = value;
    notifyListeners();
  }

  void addTask(String taskTitle) {
    taskList.add(
      Task(title: taskTitle, isChecked: false),
    );
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }
}
