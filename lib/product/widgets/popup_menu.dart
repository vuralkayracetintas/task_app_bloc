import 'package:flutter/material.dart';

import 'package:task_app/product/models/task_model.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallBack,
    required this.likeOrDislike,
    required this.editTask,
    required this.restoreTask,
  });
  final Task task;
  final Function() cancelOrDeleteCallBack;
  final Function() likeOrDislike;
  final Function() editTask;

  final Function() restoreTask;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        // color: ColorConstants.tiffaniyBlue,
        // color: Colors.white,
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    onTap: null,
                    child: TextButton.icon(
                        onPressed: editTask,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                  ),
                  PopupMenuItem(
                    onTap: likeOrDislike,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add to Favorite')
                            : const Text('Remove from Favorite')),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                  ),
                ]
            : (context) => [
                  PopupMenuItem(
                    onTap: restoreTask,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore),
                        label: const Text('Restore')),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Permanently')),
                  )
                ]);
  }
}
