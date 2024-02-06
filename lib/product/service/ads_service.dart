import 'dart:io';

import 'package:task_app/service_keys.dart';

class AdsService {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return ServiceKeys.bannerUIAndroid;
    } else if (Platform.isIOS) {
      return ServiceKeys.bannerUIAndroid;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return ServiceKeys.interstitialUIAndroid;
    } else if (Platform.isIOS) {
      return ServiceKeys.interstitialUIios;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
