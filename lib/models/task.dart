class Task {
  String? id; // خاصية قابلة للقراءة والكتابة
  String title;
  bool completed;
  String priorty; //+
  DateTime? completionDate; //+

  Task({
    this.id,
    required this.title,
    this.completed = false,
    this.priorty = 'Medium',//+
    this.completionDate, //+
  });

  get priority => null;
}
