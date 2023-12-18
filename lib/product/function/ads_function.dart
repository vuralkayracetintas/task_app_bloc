import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_app/product/service/ads_service.dart';

class AdsFunction extends ChangeNotifier {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  void loadIntestitialAd() {
    InterstitialAd.load(
      adUnitId: AdsService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          showInterstitialAd();
          debugPrint("Interstitial Ad Loaded");
        },
        onAdFailedToLoad: (error) {
          debugPrint("Interstitial Ad Failed to Load");
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      debugPrint("Interstitial Ad Not Loaded");
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        debugPrint("Interstitial Ad onAdShowedFullScreenContent");
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint("Interstitial Ad onAdDismissedFullScreenContent");
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint("Interstitial Ad onAdFailedToShowFullScreenContent: $error");
        ad.dispose();
      },
    );
    interstitialAd!.show();
  }

  void loadBannerAd() {
    BannerAdListener bannerAdListener =
        BannerAdListener(onAdWillDismissScreen: (ad) {
      ad.dispose();
    }, onAdClosed: (ad) {
      debugPrint("Ad Got Closeed");
    });
    BannerAd bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdsService.bannerAdUnitId,
      listener: bannerAdListener,
      request: const AdRequest(),
    );

    bannerAd.load();
    this.bannerAd = bannerAd;
    notifyListeners();
  }

  Widget getAd() {
    BannerAdListener bannerAdListener =
        BannerAdListener(onAdWillDismissScreen: (ad) {
      ad.dispose();
    }, onAdClosed: (ad) {
      debugPrint("Ad Got Closeed");
    });
    BannerAd bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdsService.bannerAdUnitId,
      listener: bannerAdListener,
      request: const AdRequest(),
    );

    bannerAd.load();

    return SizedBox(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
  }
}
