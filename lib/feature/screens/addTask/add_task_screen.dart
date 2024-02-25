import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/function/ads_function.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/service/guid.dart';

final class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GoogleAds googleAds = GoogleAds();
  // AdsFunction adsFunction = AdsFunction();

  @override
  void initState() {
    // googleAds.loadIntestitialAd();
    super.initState();
    debugPrint('ads initialize');
  }

  @override
  void dispose() {
    super.dispose();
    // googleAds.loadIntestitialAd();
    debugPrint('ads dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.low,
      child: Column(
        children: [
          SizedBox(height: context.sized.height * 0.03),
          Text(
            LocaleKeys.ad_edit_task_main,
            style: context.general.textTheme.titleLarge,
          ).tr(),
          SizedBox(height: context.sized.height * 0.013),
          TextField(
            autofocus: true,
            controller: titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text(LocaleKeys.ad_edit_task_title.tr()),
              // focusedBorder:
              //     OutlineInputBorder(borderSide: BorderSide(width: 2)),
              // enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.red, width: 2)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2)),
            ),
          ),
          SizedBox(height: context.sized.height * 0.025),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 5,
            maxLines: 20,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              // labelText: 'Description',
              label: const Text(LocaleKeys.ad_edit_task_description).tr(),
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: context.sized.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(LocaleKeys.general_button_cancel).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Warning'),
                          content: const Text('Title cannot be empty.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // _showInterstitialAd();
                    // googleAds.showInterstitialAd();

                    var task = titleController.text;
                    var desc = descriptionController.text;
                    context.read<TasksBloc>().add(
                          AddTask(
                            task: Task(
                              title: task,
                              id: GUIDGen.generate(),
                              description: desc,
                              date: DateTime.now().toString(),
                            ),
                          ),
                        );
                    // _interstitialAd?.show();
                    // if (_interstitialAd != null) {
                    //   _interstitialAd?.show();
                    //   print('add loaded');
                    // } else {
                    //   print('add not found');
                    // }
                    // _showInterstitialAd();

                    Navigator.pop(context);
                    debugPrint(task);
                    debugPrint(desc);
                    debugPrint(GUIDGen.generate());
                  }
                },
                child: const Text(LocaleKeys.general_button_save).tr(),
              ),
            ],
          ),
          // SizedBox(height: context.sized.height * 0.3)
        ],
      ),
    );
  }
}
