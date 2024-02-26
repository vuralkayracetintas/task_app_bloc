import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/feature/screens/addTask/add_task_screen.dart';
import 'package:task_app/feature/screens/completed/completed_task_screen.dart';

import 'package:task_app/feature/screens/favorite/favorite_task_screen.dart';
import 'package:task_app/feature/screens/pending/pending_screen.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/service/google_ads/ads_service.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';

import 'package:task_app/product/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // final AdsFunction adsFunction = AdsFunction();
  BannerAd? bannerAd;
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        // elevation: 10,

        backgroundColor: context.general.appTheme.backgroundColor,
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) => const AddTaskScreen());
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'pageName': const PendingScreen(),
      'title': LocaleKeys.home_todo_title.tr()
    },
    {
      'pageName': const CompletedScreen(),
      'title': LocaleKeys.home_completed_title.tr()
    },
    {
      'pageName': const FavoriteScreen(),
      'title': LocaleKeys.home_favorite_title.tr()
    }
  ];

  var _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _createBanner();
  }

  @override
  void dispose() {
    super.dispose();

    _createBanner();
  }

  void _createBanner() {
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdsService.bannerAdUnitId,
      listener: AdsService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdsService.interstitialAdUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (InterstitialAd ad) => _interstitialAd = ad,
  //       onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
  //     ),
  //   );
  // }

  List<String> appBarText = [
    LocaleKeys.home_todo_title.tr(),
    LocaleKeys.home_completed_title.tr(),
    LocaleKeys.home_favorite_title.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Notedle",
          style: context.general.textTheme.headlineMedium?.copyWith(
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: context.general.appTheme.appBarTheme.backgroundColor,
      ),
      drawer: const DrawerWidget(),
      body: _pages[_selectedPage]['pageName'],

      floatingActionButton: _selectedPage == 0
          ? FloatingActionButton(
              tooltip: 'Add Task',
              onPressed: () => _addTask(context),
              child: Icon(
                Icons.add,
                color: context
                    .general.appTheme.floatingActionButtonTheme.foregroundColor,
              ),
            )
          : null,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          bannerAd == null
              ? Container()
              : SizedBox(
                  height: bannerAd!.size.height.toDouble(),
                  width: bannerAd!.size.width.toDouble(),
                  child: AdWidget(ad: bannerAd!),
                ),
          BottomNavigationBar(
            // type: BottomNavigationBarType.shifting,

            elevation: 10,
            currentIndex: _selectedPage,
            onTap: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.list,
                ),
                label: LocaleKeys.home_todo_bottom_nav.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.done),
                label: LocaleKeys.home_completed_bottom_nav.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                // label: _pages[2]['title']
                label: LocaleKeys.home_favorite_bottom_nav.tr(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
