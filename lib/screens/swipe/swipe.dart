import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combat_food/screens/swipe/setting_screen/setting.dart';
import 'package:combat_food/shared/app_header.dart';
import 'package:flutter/material.dart';
import 'package:combat_food/shared/bottom-nav.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'explore_page.dart';
import 'likes_page.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int pageIndex = 0;
  List<int> likeList = [];

  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    likeList = [];
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
              await Future.delayed(Duration(seconds: 1));
              print('sleep end');
            }
            setState(() {
              inProgress = false;
            });
          },
        ),
        body: getBody(),
        bottomSheet: BottomNavBar(),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExplorePage(
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
          addLikes: (int likes) {
            likeList.add(likes);
          },
        ),
        LikesPage(
          likes: [0, 1, 2, 3, 4],
        ),
        Setting(),
      ],
    );
  }
}
