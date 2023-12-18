import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/function/ads_function.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/service/guid.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    AdsFunction adsFunction = AdsFunction();
    bool adShown = false;
    return Container(
      color: context.general.appTheme.backgroundColor,
      padding: context.padding.onlyBottomHigh,
      child: Container(
        padding: context.padding.low,
        child: Column(
          children: [
            Text(
              'Add Task',
              style: context.general.textTheme.titleLarge,
            ),
            SizedBox(height: context.sized.height * 0.013),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                // focusedBorder:
                //     OutlineInputBorder(borderSide: BorderSide(width: 2)),
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red, width: 2)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2)),
              ),
            ),
            SizedBox(height: context.sized.height * 0.025),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    //! add ads
                    // googleAds.showInterstitialAd2();
                    if (!adShown) {
                      // googleAds.showInterstitialAd2();
                      adsFunction.loadIntestitialAd();
                      // Mark that the ad has been shown
                      adShown = true;
                    }

                    var task = titleController.text;
                    var desc = descriptionController.text;
                    context.read<TasksBloc>().add(AddTask(
                            task: Task(
                          title: task,
                          id: GUIDGen.generate(),
                          description: desc,
                          date: DateTime.now().toString(),
                        )));
                    Navigator.pop(context);
                    print(task);
                    print(desc);
                    print(GUIDGen.generate());
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            SizedBox(height: context.sized.height * 0.3)
          ],
        ),
      ),
    );
  }
}
