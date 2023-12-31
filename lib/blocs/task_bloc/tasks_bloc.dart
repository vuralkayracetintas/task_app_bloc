import 'package:equatable/equatable.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<FavoriteOrUnFavoriteTask>(_onFavoriteOrUnFavoriteTask);
    on<EditTasks>(_onEditTask);
    on<RestoreTasks>(_onRestoreTask);
    on<DeleteAllTasks>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTask: List.from(state.pendingTask)..add(event.task),
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.completedTask;

    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: completedTask,
      favoriteTask: state.favoriteTask,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTask: state.pendingTask,
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTask: List.from(state.pendingTask)..remove(event.task),
        completedTask: List.from(state.completedTask)..remove(event.task),
        favoriteTask: List.from(state.favoriteTask)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  // void _onFavoriteOrUnFavoriteTask(
  //     FavoriteOrUnFavoriteTask event, Emitter<TasksState> emit) {
  //   final state = this.state;
  //   List<Task> pendingTask = state.pendingTask;
  //   List<Task> completedTask = state.completedTask;
  //   List<Task> favoriteTask = state.favoriteTask;
  //   if (event.task.isDone == false) {
  //     if (event.task.isFavorite == false) {
  //       var taskIndex = pendingTask.indexOf(event.task);
  //       pendingTask = List.from(pendingTask)
  //         ..remove(event.task)
  //         ..insert(taskIndex, event.task.copyWith(isFavorite: true));
  //       favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
  //     } else {
  //       var taskIndex = pendingTask.indexOf(event.task);
  //       pendingTask = List.from(pendingTask)
  //         ..remove(event.task)
  //         ..insert(taskIndex, event.task.copyWith(isFavorite: false));
  //       favoriteTask.remove(event.task);
  //     }
  //   } else {
  //     if (event.task.isFavorite == false) {
  //       var taskIndex = completedTask.indexOf(event.task);
  //       completedTask = List.from(completedTask)
  //         ..remove(event.task)
  //         ..insert(taskIndex, event.task.copyWith(isFavorite: true));
  //       favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
  //     } else {
  //       var taskIndex = completedTask.indexOf(event.task);
  //       completedTask = List.from(completedTask)
  //         ..remove(event.task)
  //         ..insert(taskIndex, event.task.copyWith(isFavorite: false));
  //       favoriteTask.remove(event.task);
  //     }
  //   }
  //   emit(TasksState(
  //     pendingTask: pendingTask,
  //     completedTask: completedTask,
  //     favoriteTask: favoriteTask,
  //     removedTasks: state.removedTasks,
  //   ));
  // }

  void _onFavoriteOrUnFavoriteTask(
      FavoriteOrUnFavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTask = List.from(state.pendingTask);
    List<Task> completedTask = List.from(state.completedTask);
    List<Task> favoriteTask = List.from(state.favoriteTask);
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTask.indexOf(event.task);
        pendingTask.remove(event.task);
        pendingTask.insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTask.indexOf(event.task);
        pendingTask.remove(event.task);
        pendingTask.insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask.remove(event.task);
        completedTask.insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask.remove(event.task);
        completedTask.insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
    }
    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: completedTask,
      favoriteTask: favoriteTask,
      removedTasks: state.removedTasks,
    ));
  }

  void _onEditTask(EditTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favouriteTask = List.from(state.favoriteTask);
    if (event.oldTask.isFavorite == true) {
      // favouriteTask
      //   ..remove(event.oldTask)
      //   ..insert(0, event.newTask);
      favouriteTask.remove(event.oldTask);
      favouriteTask.insert(0, event.newTask);
    }
    emit(
      TasksState(
        pendingTask: List.from(state.pendingTask)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completedTask: state.completedTask..remove(event.oldTask),
        favoriteTask: favouriteTask,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onRestoreTask(RestoreTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTask: List.from(state.pendingTask)
          ..insert(
              0,
              event.task.copyWith(
                isDeleted: false,
                isDone: false,
                isFavorite: false,
              )),
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
      ),
    );
  }

  void _onDeleteAllTask(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..clear(),
        pendingTask: state.pendingTask,
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
