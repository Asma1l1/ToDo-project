import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do2_application_1/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
   
  ];

  get tasks => null!;
     Future<void> fetchTasks() async {
       final snapshot = await FirebaseFirestore.instance.collection('tasks').get();
       _tasks.clear();
       for (var doc in snapshot.docs) {
         _tasks.add(Task(
           id: doc.id,
           title: doc['title'],
           completed: doc['completed'],
           priorty: doc['priority'],
           completionDate: (doc['completionDate'] as Timestamp).toDate(),
         ));
       }
       notifyListeners();
     }

  //******************************* */

     Future<void> addTask(Task task) async {
       final docRef = await FirebaseFirestore.instance.collection('tasks').add({
         'title': task.title,
         'completed': task.completed,
         'priority': task.priorty,
         'completionDate': task.completionDate,
       });
       task.id = docRef.id;
       _tasks.add(task);
       notifyListeners();
     }

//*********************************

     Future<void> removeTask(int index) async {
       final taskId = _tasks[index].id;
       await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
       _tasks.removeAt(index);
       notifyListeners();
     }

     //***************************** */

     Future<void> makeTaskCompleted(int index) async {
       final task = _tasks[index];
       task.completed = !task.completed;
       await FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
         'completed': task.completed,
       });
       notifyListeners();
     }
  
}
