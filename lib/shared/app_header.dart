import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef IntCallback = void Function(int id, int pre_id);

class AppHeader extends StatelessWidget with PreferredSizeWidget {
  AppHeader({required this.onPressed, required this.pageIndex});

  final IntCallback onPressed;
  final int pageIndex;

  List<String> items = [
    "assets/images/explore.svg",
    "assets/images/order.svg",
    "assets/images/setting.svg",
  ];
  List<String> activeItems = [
    "assets/images/explore_active.svg",
    "assets/images/order_active.svg",
    "assets/images/setting_active.svg",
  ];

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              onPressed: () {
                onPressed(index, pageIndex);
              },
              icon: SvgPicture.asset(
                  pageIndex == index ? activeItems[index] : items[index]),
            );
          }),
        ),
      ),
    );
  }
}
