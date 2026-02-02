class Task {
  int? id;
  String title;
  bool done;
  int priorty;

  Task({
    required this.done,
    required this.title,
    required this.priorty
  });

  Task.fromJson(Map<String, dynamic> json)
  : id = json['id'] as int,
    title = json['title'] as String,
    done = json['done'] as bool,
    priorty = json['priority'] as int;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
      'priorty': priorty
    };
  }
}