import 'package:flutter/material.dart';
import 'package:to_do2_application_1/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: '',
      completed: false,
      priorty: 'Medium', //+
      completionDate: DateTime.now().add(Duration(days: 3)), //+
    )
  ];
  List<Task> get tasks {
    return _tasks;
  }

  void addTask(task) {
    _tasks.add(task);
    notifyListeners(); //تغير العدد الموجود في المهمات
  }

  void removeTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void makeTaskCompleted(index) {
    _tasks[index].completed = !_tasks[index].completed;
    notifyListeners();
  }
  
}
