part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Task task;

  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class FavoriteOrUnFavoriteTask extends TasksEvent {
  final Task task;

  const FavoriteOrUnFavoriteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class EditTasks extends TasksEvent {
  final Task oldTask;
  final Task newTask;

  const EditTasks({required this.oldTask, required this.newTask});

  @override
  List<Object> get props => [oldTask, newTask];
}

class RestoreTasks extends TasksEvent {
  final Task task;

  const RestoreTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TasksEvent {}
