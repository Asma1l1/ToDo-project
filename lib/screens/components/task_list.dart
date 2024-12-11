import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do2_application_1/providers/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    // التحقق من وجود مهام
    if (taskProvider.tasks.isEmpty) {
      return Center(child: Text('No tasks available.'));
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(taskProvider
                  .tasks[index].title), // استخدم عنوان المهمة كمفتاح
              background: Container(
                color: Theme.of(context).colorScheme.error,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // حذف المهمة مباشرة
                taskProvider.removeTask(index);
              },
              child: ListTile(
                title: Text(
                  taskProvider.tasks[index].title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //+++++++++++++++++++++++
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // [إضافة] عرض الأولوية
                    Text("Priority: ${taskProvider.tasks[index].priorty}"),
                    // [إضافة] التأكد من عرض التاريخ إذا كان موجودًا
                    if (taskProvider.tasks[index].completionDate != null)//{
                        Text(
                          "Due: ${taskProvider.tasks[index].completionDate!.toLocal().toString().split(' ')[0]}", // عرض التاريخ فقط بدون الوقت
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                        
                    //},
                  ],
                ),
                //++++++++++++++++++++++++

                trailing: Image.asset(
                  taskProvider.tasks[index].completed
                      ? 'assets/icons/completed.png'
                      : 'assets/icons/non-completed.png',
                ),
                onTap: () {
                  taskProvider.makeTaskCompleted(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:to_do2_application_1/providers/task_provider.dart';

// class TaskList extends StatelessWidget {
//   const TaskList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = context.watch<TaskProvider>();
//     return Flexible(
//       flex: 10,
//       child: Container(
//         margin: const EdgeInsets.only(left: 16, right: 16),
//         child: ListView.builder(
//           itemCount: taskProvider.tasks.length,
//           itemBuilder: (context, index) {
//             return Container(
//                 child: Dismissible(
//                     key: Key(taskProvider.tasks[index].toString()),

//                     background: Container(
//                       color: Theme.of(context).colorScheme.error,
//                       child: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.only(right: 20),
//                     ),
//                     direction: DismissDirection.endToStart,
//                     onDismissed: (direction) {
//                       taskProvider.removeTask(index);
//                     },
//                     child: ListTile(
//                       title: Text(taskProvider.tasks[index].title,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold)),
//                       trailing: Image(
//                         image: taskProvider.tasks[index].completed
//                             ? AssetImage('assets/icons/completed.png')
//                             : AssetImage('assets/icons/non-completed.png'),
//                       ),
//                       onTap: () {
//                         taskProvider.makeTaskCompleted(index);
//                       },
//                     )
//                     )
//                     );
//           },
//         ),
//       ),
//     );
//   }
// }

