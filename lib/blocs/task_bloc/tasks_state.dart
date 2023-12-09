part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> removedTasks;
  const TasksState({
    this.pendingTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.favoriteTask = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTask, removedTasks, favoriteTask, completedTask];

  Map<String, dynamic> toMap() {
    return {
      'pendingTask': pendingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTask:
          List<Task>.from(map['pendingTask']?.map((x) => Task.fromMap(x))),
      completedTask:
          List<Task>.from(map['completedTask']?.map((x) => Task.fromMap(x))),
      favoriteTask:
          List<Task>.from(map['favoriteTask']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
