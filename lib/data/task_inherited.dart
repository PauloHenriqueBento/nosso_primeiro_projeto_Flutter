import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Aprender ReactJS', 'assets/images/react.png', 2),
    Task('Aprender Angular', 'assets/images/angular.png', 5),
    Task('Aprender VueJs', 'assets/images/vue.png', 1),
    Task('Aprender ReactJS', 'assets/images/react.png', 2),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
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
