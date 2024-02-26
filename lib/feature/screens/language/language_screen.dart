import 'package:flutter/material.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static const id = 'language_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ProductLocalization.updateLanguage(
                  context: context,
                  value: Locales.en,
                );
              },
              child: const Text(
                "Translate EN",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ProductLocalization.updateLanguage(
                  context: context,
                  value: Locales.tr,
                );
              },
              child: const Text(
                "Translate TR",
              ),
            ),

            // GridView.builder(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return Image(image: AssetImage('assets/country/turkish.png'));
            //   },
            // ),
            const Image(image: AssetImage('assets/country/turkish.png')),
            const Image(image: AssetImage('assets/country/germany.png')),
            const Image(image: AssetImage('assets/country/english.png')),
            const Image(image: AssetImage('assets/country/spanish.png')),
          ],
        ),
      ),
    );
  }
}
/// image aset 
/// cevirilecek dil 
