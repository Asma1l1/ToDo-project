import 'package:flutter/material.dart';
import 'package:to_do2_application_1/screens/components/task_form.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        builder: (BuildContext context){
          return const TaskForm();
        },
        context: context,
        ),
      backgroundColor: const Color.fromARGB(255, 200, 205, 220),
      child: const Icon(Icons.add),
      );
  }
}
