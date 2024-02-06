import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/feature/screens/addTask/add_task_screen.dart';
import 'package:task_app/feature/screens/completed/completed_task_screen.dart';

import 'package:task_app/feature/screens/favorite/favorite_task_screen.dart';
import 'package:task_app/feature/screens/pending/pending_screen.dart';
import 'package:task_app/product/service/ads_service.dart';

import 'package:task_app/product/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // final AdsFunction adsFunction = AdsFunction();
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  final List<Map<String, dynamic>> _pages = [
    {'pageName': const PendingScreen(), 'title': "Pending Task"},
    {'pageName': const CompletedScreen(), 'title': "Completed Task"},
    {'pageName': const FavoriteScreen(), 'title': "Favorite Task"}
  ];

  var _selectedPage = 0;
  BannerAd? bannerAd;

  @override
  void initState() {
    super.initState();
    // adsFunction.loadIntestitialAd();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
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
              : Container(
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
                label: _pages[0]['title'],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.done),
                label: _pages[1]['title'],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: _pages[2]['title'],
              )
            ],
          ),
        ],
      ),
    );
  }
}
