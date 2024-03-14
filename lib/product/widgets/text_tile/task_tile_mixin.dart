part of 'task_tile.dart';

mixin TaskTileMixin on State<TaskTile> {
  void updateTask(BuildContext context) {
    context.read<TasksBloc>().add(UpdateTask(task: widget.task));
  }
}
