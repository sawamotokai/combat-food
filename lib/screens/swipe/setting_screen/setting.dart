import 'package:combat_food/screens/swipe/setting_screen/food_type/food_type_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/price/price_field.dart';
import 'package:flutter/material.dart';

import 'distance/distance_field.dart';
import 'food_type/food_type_check_list.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<Setting> {
  void tempFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // ignore: prefer_const_constructors
      height: size.height * 0.8,

      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: [
            Container(
              // flex: 1,
              child: PriceField(),
            ),
            Container(
              // flex: 1,
              child: DistanceField(),
            ),
            Container(
              // flex: 1,
              child: FoodTypeField(),
            ),
          ]),
        ),
      ),
    );
  }
}
