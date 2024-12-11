import 'package:flutter/material.dart';
import 'package:to_do2_application_1/screens/components/add_task_button.dart';
import 'package:to_do2_application_1/screens/components/task_list.dart';
import 'package:to_do2_application_1/screens/components/welcome.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Welcome(name: 'Asma M', avatar: 'assets/icons/avatar.png'),
        AddTaskButton(),
        TaskList(),
        
      ],
    );
  }
}