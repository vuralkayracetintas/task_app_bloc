part of 'card_top_widget.dart';

mixin CardTopWidgetMixin on State<CardTop> {
  void editTask(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: context.general.appTheme.colorScheme.onPrimary,
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => EditTaskScreen(
              oldTask: widget.task,
            ));
  }

  void removeOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void likeOrDislike() {
    context.read<TasksBloc>().add(FavoriteOrUnFavoriteTask(task: widget.task));
  }

  void restoreTask() {
    context.read<TasksBloc>().add(RestoreTasks(task: widget.task));
  }

  void _completeTask() {
    context.read<TasksBloc>().add(UpdateTask(task: widget.task));
  }
}
