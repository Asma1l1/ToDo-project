class Task {
  String title;
  bool completed;
  String priorty; //+
  DateTime? completionDate; //+

  Task({
    required this.title,
    this.completed = false,
    this.priorty = 'Medium',//+
    this.completionDate, //+
  });
}
