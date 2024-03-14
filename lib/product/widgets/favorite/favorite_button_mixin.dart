part of 'favorite_button.dart';

mixin FavoriteButtonMixin on State<FavoriteButton> {
  void favoriteUnFavorite() {
    context.read<TasksBloc>().add(FavoriteOrUnFavoriteTask(task: widget.task));
  }
}
