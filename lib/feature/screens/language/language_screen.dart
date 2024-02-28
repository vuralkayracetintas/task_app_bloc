import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/feature/screens/language/selected_language_container.dart';
import 'package:task_app/feature/screens/pending/pending_screen.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/utility/constant/enums/image.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';
import 'package:task_app/product/widgets/hexagon.dart';
import 'package:task_app/product/widgets/localization/locale_text.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static const id = 'language_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: context.padding.low,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(TabScreen.id),
                      child: const LocaleText(
                          text: LocaleKeys.general_button_save),
                    ),
                  ],
                ),
                Padding(padding: context.padding.onlyTopLow),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      SelectedLanguageContainer(
                        flagImageAsset: ImageEnum.flagTr,
                        languageName: LocaleKeys.language_turkey,
                        languageLocale:
                            ProductLocalization.supportedLocalesValue[0],
                        onTap: () {
                          ProductLocalization.updateLanguage(
                            context: context,
                            value: Locales.tr,
                          );
                        },
                      ),
                      SelectedLanguageContainer(
                        flagImageAsset: ImageEnum.flagEn,
                        languageName: LocaleKeys.language_english,
                        languageLocale:
                            ProductLocalization.supportedLocalesValue[1],
                        onTap: () {
                          ProductLocalization.updateLanguage(
                            context: context,
                            value: Locales.en,
                          );
                        },
                      ),
                      SelectedLanguageContainer(
                        flagImageAsset: ImageEnum.flagDe,
                        languageName: LocaleKeys.language_german,
                        languageLocale:
                            ProductLocalization.supportedLocalesValue[2],
                        onTap: () {
                          ProductLocalization.updateLanguage(
                            context: context,
                            value: Locales.de,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
