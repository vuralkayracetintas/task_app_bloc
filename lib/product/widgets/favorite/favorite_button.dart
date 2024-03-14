import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';

part 'favorite_button_mixin.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.task});
  final Task task;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with FavoriteButtonMixin {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: context.sized.height * 0.025,
          backgroundColor: context
              .general.appTheme.floatingActionButtonTheme.backgroundColor,
        ),
        widget.task.isFavorite == false
            ? IconButton(
                iconSize: context.sized.height * 0.02,
                color: Colors.white,
                onPressed: () => favoriteUnFavorite(),
                icon: const Icon(Icons.favorite_border))
            : IconButton(
                iconSize: context.sized.height * 0.02,
                color: Colors.white,
                onPressed: () => favoriteUnFavorite(),
                icon: const Icon(Icons.favorite))
      ],
    );
  }
}
