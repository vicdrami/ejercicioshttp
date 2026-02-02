import 'package:ejercicioshttp/models/task.dart';
import 'package:ejercicioshttp/provider/tasks_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TasksService(),
      child: const TaskApp(),
    ),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Products',
      debugShowCheckedModeBanner: false,
      home: const Tasks(),
    );
  }
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  Widget build(BuildContext context){
    final service = context.watch<TasksService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newTask = Task(
                id: (context.read<TasksService>().tasks.length + 1).toString() ,
                title: 'Nueva tarea',
                done: false,
                priorty: 1,
              );
              context.read<TasksService>().createTask(newTask);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: service.tasks.length,
        itemBuilder: (context, index) {
          final Task task = service.tasks[index];
          return ListTile(
            title: Text(task.title),
            //subtitle: Text(task.id.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(task.done.toString()),
                Text(task.priorty.toString()),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<TasksService>().deleteTask(task);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    if (task.id == null) return;
                    final updatedProduct = Task(
                      id: task.id,
                      title: '${task.title} (editado)',
                      done: !task.done,
                      priorty: task.priorty + 1
                    );
                    context.read<TasksService>().updateTask(
                    updatedProduct,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
