import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
        taskName: "Aprender Flutter",
        taskPhoto: "assets/images/flutter.jpg",
        taskDifficulty: 3),
    Task(
      taskName: "Aprender Arquitetura",
      taskPhoto: "assets/images/architecture.jpg",
      taskDifficulty: 2,
    ),
    Task(
      taskName: "Aprender Android",
      taskPhoto: "assets/images/android.jpg",
      taskDifficulty: 4,
    ),
    Task(
      taskName: "Aprender iOS",
      taskPhoto: "assets/images/ios.jpg",
      taskDifficulty: 4,
    ),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(
        Task(
            taskName: name,
            taskPhoto: photo,
            taskDifficulty: difficulty
        )
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
