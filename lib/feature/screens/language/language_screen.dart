import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/feature/screens/language/selected_language_container.dart';
import 'package:task_app/feature/screens/pending/pending_screen.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/utility/constant/enums/image.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static const id = 'language_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //         context, MaterialPageRoute(builder: (context) => TabScreen()));

          //     // Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.arrow_back),
          // ),
          ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     ProductLocalization.updateLanguage(
            //       context: context,
            //       value: Locales.en,
            //     );
            //     print('Selected Language : ${Locales.en.locale}');
            //   },
            //   child: const Text(
            //     "Translate EN",
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     ProductLocalization.updateLanguage(
            //       context: context,
            //       value: Locales.tr,
            //     );
            //     print('Selected Language : ${Locales.tr.locale}');
            //   },
            //   child: const Text(
            //     "Translate TR",
            //   ),
            // ),

            // GridView.builder(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return Image(image: AssetImage('assets/country/turkish.png'));
            //   },
            // ),
            // const Image(image: AssetImage('assets/country/turkish.png')),
            // const Image(image: AssetImage('assets/country/germany.png')),
            // const Image(image: AssetImage('assets/country/english.png')),
            // const Image(image: AssetImage('assets/country/spanish.png')),
            // SelectedLanguageContainer(
            //   flagImageAsset: ImageEnum.flagTr,
            //   languageName: 'Turkce',
            //   languageLocale: ProductLocalization.supportedLocalesValue.first,
            //   onTap: () {
            //     ProductLocalization.updateLanguage(
            //       context: context,
            //       value: Locales.tr,
            //     );
            //   },
            // ),
            // SelectedLanguageContainer(
            //   flagImageAsset: ImageEnum.flagEn,
            //   languageName: 'Inglizce',
            //   languageLocale: ProductLocalization.supportedLocalesValue.last,
            //   onTap: () {
            //     ProductLocalization.updateLanguage(
            //       context: context,
            //       value: Locales.en,
            //     );
            //   },
            // ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: context.padding.low,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  SelectedLanguageContainer(
                    flagImageAsset: ImageEnum.flagTr,
                    languageName: 'Turkce',
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
                    languageName: 'Inglizce',
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
                    languageName: 'Almanca',
                    languageLocale:
                        ProductLocalization.supportedLocalesValue[2],
                    onTap: () {
                      ProductLocalization.updateLanguage(
                        context: context,
                        value: Locales.de,
                      );
                    },
                  ),

                  // SelectedLanguageContainer(
                  //   flagImageAsset: ImageEnum.flagDe,
                  //   languageName: 'Almanca',
                  //   languageLocale:
                  //       ProductLocalization.supportedLocalesValue.last,
                  //   onTap: () {
                  //     ProductLocalization.updateLanguage(
                  //       context: context,
                  //       value: Locales.de,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
