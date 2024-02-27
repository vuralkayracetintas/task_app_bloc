import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';

@immutable

/// Product Localization Manager
final class ProductLocalization extends EasyLocalization {
  ProductLocalization({
    super.key,
    required super.child,
  }) : super(
          supportedLocales: supportedLocalesValue,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  /// Project supported locales
  static final List<Locale> supportedLocalesValue = [
    Locales.tr.locale,
    Locales.en.locale,
    Locales.de.locale,
  ];

  /// Translation path string
  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static void updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      // context.locale(value.locale);
      context.setLocale(value.locale);
}
