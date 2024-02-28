import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/product/utility/constant/enums/image.dart';

import 'package:task_app/product/widgets/localization/locale_text.dart';

class SelectedLanguageContainer extends StatelessWidget {
  const SelectedLanguageContainer({
    Key? key,
    required this.flagImageAsset,
    required this.languageName,
    required this.languageLocale,
    required this.onTap,
  }) : super(key: key);

  final ImageEnum flagImageAsset;
  final String languageName;
  final Locale languageLocale;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
   

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: context.padding.low,
        alignment: Alignment.center,
        height: context.sized.dynamicHeight(0.125),
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            border: Border.all(
              color: isSelectedLanguage(context) ? Colors.green : Colors.red,
              width: 2,
            ),
            // color: isSelectedLanguage(context) ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // width: context.sized.mediumHighValue,
                  // height: context.customSized.mediumHighValue,

                  // clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.sized.highValue)),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    flagImageAsset.toFlag,
                  ),
                ),
                Padding(padding: context.padding.horizontalLow),
                LocaleText(
                  text: languageName,
                  // textStyle: GoogleFonts.baloo2(
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 18,
                  // ),
                ),
              ],
            ),
            // SizedBox(
            //   height: context.sized.mediumValue,
            //   width: context.sized.mediumValue,
            //   child: Icon(
            //     isSelectedLanguage(context)
            //         ? Icons.check
            //         : Icons.circle_outlined,
            //     // color: ColorConstants.smootGreen.getColor,
            //     size: context.sized.mediumValue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  bool isSelectedLanguage(BuildContext context) {
    if (context.locale == languageLocale) {
      return true;
    } else {
      return false;
    }
  }
}
