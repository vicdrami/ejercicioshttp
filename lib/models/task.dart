class Task {
  String id;
  String title;
  bool done;
  int priorty;

  Task({
    required this.id,
    required this.done,
    required this.title,
    required this.priorty
  });

  Task.fromJson(Map<String, dynamic> json)
  : id = json['id'] as String,
    title = json['title'] as String,
    done = json['done'] as bool,
    priorty = json['priority'] as int;
}