import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combat_food/screens/swipe/setting_screen/setting.dart';
import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/app_header.dart';
import 'package:flutter/material.dart';
import 'package:combat_food/shared/bottom-nav.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'explore_page.dart';
import 'likes_page.dart';
import 'dart:convert';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int pageIndex = 0;
  List<String> likeList = [];
  List<String> disLikeList = [];

  bool inProgress = false;

  Map<String, String> productsRequestBody = {
    'price_low': '2.00',
    'price_high': '4.00',
    'food_type': 'Japanese',
    'item_type': 'Ingredient',
  };

  @override
  void initState() {
    super.initState();
    likeList = [];
    disLikeList = [];
    pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inProgress,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppHeader(
          pageIndex: pageIndex,
          onPressed: (int index, int preIndex) async {
            print("$index $preIndex");
            setState(() {
              inProgress = true;
              pageIndex = index;
            });
            if (preIndex == 0) {
              // send likes list
              print('sleep start');
              await postReq('${dotenv.env["BASE_URL"]}/likes', {
                'likes': jsonEncode(likeList),
                'disLikes': jsonEncode(disLikeList),
              });
              print('sleep end');
            }
            setState(() {
              inProgress = false;
            });
          },
        ),
        body: getBody(),
        bottomSheet: const BottomNavBar(),
      ),
    );
  }

  Widget getBody() {
    // print(data['images']);
    return IndexedStack(
      index: pageIndex,
      children: [
        FutureBuilder(
          future: getExploreItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              ExplorePage(
                data: snapshot.data! as Map<String, dynamic>,
                goToLikes: () async {
                  // send likes list
                  print('sleep start');
                  setState(() {
                    inProgress = true;
                    pageIndex = 1;
                  });
                  await Future.delayed(Duration(seconds: 3));
                  print('sleep end');
                  setState(() {
                    inProgress = false;
                  });
                },
                addLikes: (String proudctId) {
                  likeList.add(proudctId);
                },
                addDisLikes: (String productId) {
                  disLikeList.add(productId);
                },
                requestBody: productsRequestBody,
              );
            }
            return Text("No data");
          },
        ),
        // LikesPage(),
        Scaffold(),
        Setting(),
      ],
    );
  }
}
