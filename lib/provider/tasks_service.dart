import 'dart:collection';
import 'dart:convert';
import 'package:ejercicioshttp/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class TasksService extends ChangeNotifier {
  TasksService() {
    loadTasks();
  }

  List<Task> tasks = [];   

  Future <void> loadTasks() async {
    try {
      final uri = Uri.parse('http://localhost:3000/tasks');

      final response = await http.get(uri).timeout(const Duration(seconds: 3));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List jsonList = jsonDecode(response.body);

        tasks = [];
        for (var item in jsonList) {
          Task task = Task.fromJson(item);
          tasks.add(task);
        }
      } else {
        debugPrint('Error: ${response.statusCode}');
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}