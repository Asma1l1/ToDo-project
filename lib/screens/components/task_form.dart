import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do2_application_1/models/task.dart';
import 'package:to_do2_application_1/providers/task_provider.dart';

class TaskForm extends StatefulWidget {
  // stateFull consist of 2 classes
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final taskTitle = TextEditingController();
  String selectedPriority = "Medium"; // +
  DateTime? selectedDate; //+

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          Positioned(
            right: 1.00,
            top: 1.0,
            child: GestureDetector(
              onTap: () {
                // إغلاق نافذة الحوار والانتقال إلى الصفحة الرئيسية
                Navigator.of(context).pop();
                
              },
            child: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.close),
            ),
        )),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.00),
                  child: TextFormField(
                    controller: taskTitle,
                    decoration: const InputDecoration(hintText: "Add Task Title.."),
                  ),
                ),
                //+++++++++++++++++++++++++++++++++++++++++++++++++
                 // تحديد الأولوية
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedPriority, // [إضافة] تحديد القيمة الافتراضية للأولوية
                items: ["High", "Medium", "Low"] // [إضافة] قائمة القيم المتاحة للأولوية
                    .map((priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(priority),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPriority = value!; // [إضافة] تحديث الأولوية المحددة
                  });
                },
                decoration: InputDecoration(labelText: "Priority"), // [إضافة] تسمية الحقل
              ),
            ),
            // تحديد وقت وتاريخ الإتمام
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  // if (date != null) {
                  //   final time = await showTimePicker(
                  //     context: context,
                  //     initialTime: TimeOfDay.now(),
                    //);
                    if (date != null) {
                      setState(() {
                        selectedDate = DateTime(
                          date.year,
                          date.month,
                          date.day,
            
                        );
                         // [إضافة] تعيين التاريخ والوقت
                      }
                      );
                    }
                  },
                //},
                child: Text(
                  selectedDate == null
                      ? "Select Completion Date" // [إضافة] نص الحقل في حال عدم الاختيار
                      : selectedDate.toString().split(' ')[0], // [إضافة] عرض التاريخ والوقت المحدد
                ),
              ),
            ),
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++
                Padding(
                  padding: const EdgeInsets.all(8.00),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        context.read<TaskProvider>().addTask(Task(
                              title: taskTitle.text,
                              completed: false,
                              priorty: selectedPriority,
                              completionDate: selectedDate,
                            ));
                      }
                    },
                    child: const Text('Add Task'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
