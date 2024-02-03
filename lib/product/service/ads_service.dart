import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
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

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      print('Ad failed to load: ${ad.adUnitId}, $error');
    },
    onAdOpened: (ad) => print('Ad opened: ${ad.adUnitId}.'),
    onAdClosed: (ad) => print('Ad closed: ${ad.adUnitId}.'),
  );
}
