import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';

import 'login.dart';

class DashPage extends StatefulWidget {
  const DashPage({Key? key}) : super(key: key);

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  get error => null;

  @override
  Widget build(BuildContext context) {
    BannerAd? _bannerAd;
    bool _isLoaded = false;
    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716';

    void loadAd() {
      _bannerAd = BannerAd(
        adUnitId: adUnitId,
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            setState(() {
              _isLoaded = true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd failed to load: $error');
            // Dispose the ad here to free resources.
            ad.dispose();
          },
        ),
      )..load();
    }

    // if (FirebaseAuth.instance.currentUser == null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => SignInPage2()));
    //   });
    // }
    // if (FirebaseAuth.instance.currentUser == null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => SignInPage2()));
    //   });
    // }
    String? CheckUserName() {
      if (FirebaseAuth.instance.currentUser!.displayName != null) {
        return FirebaseAuth.instance.currentUser?.displayName;
      } else {
        return "Failed To Load Name";
      }
    }

    if (_bannerAd != null) {
      Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: ListView.separated(
          itemBuilder: (xcontex, index) {
            Map<String, dynamic> taks = getTaskList().elementAt(index);

            return ListTile(
              onTap: () {
                loadInterstitialAd(context, taks);
              },
              leading:
                  CircleAvatar(backgroundImage: NetworkImage(taks['label'])),
              title: Text(taks['title']),
              subtitle: Text(taks['Artist']),
            );
          },
          separatorBuilder: (contex, index) {
            return const SizedBox(
              height: 8.0,
            );
          },
          itemCount: getTaskList().length),
    );
  }

  List<Map<String, dynamic>> getTaskList() {
    return [
      {
        "title": "Dashboard Tab",
        "label": "https://cdn-icons-png.flaticon.com/512/1/1176.png",
        "Artist":
            "Welcome to the dashboard tab. You will find recommended and set tasks here.",
        "id": "0"
      },
      {
        "title": "Example Task 1",
        "label": "https://cdn-icons-png.flaticon.com/512/5277/5277459.png",
        "Artist": "Topic",
        "id": "0"
      },
      {
        "title": "Addition",
        "label": "https://cdn-icons-png.flaticon.com/512/1828/1828926.png",
        "Artist": "Number",
      },
      {
        "title": "Subtraction",
        "label": "https://cdn-icons-png.flaticon.com/512/66/66889.png",
        "Artist": "Number",
      },
      {
        "title": "Finding the area of a square",
        "label": "https://cdn-icons-png.flaticon.com/512/752/752382.png",
        "Artist": "Geometry",
      },
      {
        "title": "Using Number Lines",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_sonymusic/taks/A10301A0004624020X_20210720192432717/1626802810/srch_sonymusic_A10328E0010025455J.jpg",
        "Artist": "Place Value",
      },
      {
        "title": "Ordering Negative Numbers",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_sonymusic/taks/A10301A0004546070M_20210322210915848/1616444720/srch_sonymusic_A10328E0009881076Q.jpg",
        "Artist": "Negative Numbers",
      },
      {
        "title": "Simplifying Fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_universaltaks/taks/1631257115/srch_universaltaks_00602438819706-GBUM72101299.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Multiplying Fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_universaltaks/taks/1614926427/srch_universaltaks_00602435870106-USUM72102322.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Converting Fractions to Decimals",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_orchard/taks/update/20210714234654_196006720476/1626321914/srch_orchard_196006720476_QM6MZ2156864.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Converting from mixed numbers to improper fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_universaltaks/taks/1637628717/srch_universaltaks_00602445256150-INUM72100087.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Ordering Fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_sonymusic/taks/A10301A0004645633A_20210804140407209/1628079608/srch_sonymusic_A10328E0010065736U.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Adding Fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_orchard/taks/update/20220223161946_196626458629/1645652419/srch_orchard_196626458629_QM4TW2268780.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Dividing Fractions",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_universaltaks/taks/1571071623/srch_universaltaks_00602508402289-USUM71919682.jpg",
        "Artist": "Fractions",
      },
      {
        "title": "Finding the area of a rectangle",
        "label":
            "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-taks-cms/srch_universaltaks/taks/update/1594327964/srch_universaltaks_00602567332756-GBUM71706324.jpg",
        "Artist": "Geometry",
      },
    ];
  }

  void loadInterstitialAd(BuildContext context, Map<String, dynamic> taksInfo) {
    InterstitialAd? interstitialAd;
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? "ca-app-pub-4353860510202072/2056378549"
            : "ca-app-pub-4353860510202072/2056378549",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            interstitialAd!.show();
            interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(
                    onAdFailedToShowFullScreenContent: ((ad, error) {
              ad.dispose();
              interstitialAd!.dispose();
              debugPrint(error.message);
            }), onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              interstitialAd!.dispose();

              //Todo : Switch to different Screen.
            }, onAdShowedFullScreenContent: (ad) {
              ad.dispose();
              interstitialAd!.dispose();
            });
          },
          onAdFailedToLoad: (err) {
            debugPrint(err.message);
          },
        ));
  }
}
