import 'dart:ffi';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

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