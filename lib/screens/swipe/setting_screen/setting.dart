import 'package:combat_food/screens/swipe/setting_screen/apply/apply_button_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/food_type/food_type_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/logout/logout_bottun_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/price/price_field.dart';
import 'package:flutter/material.dart';
import 'distance/distance_field.dart';

class Setting extends StatefulWidget {
  Function _onPressed = () {};
  Setting(Function onPressed, {Key? key}) : super(key: key) {
    _onPressed = onPressed;
  }

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
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: SingleChildScrollView(
        child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            shrinkWrap: true,
            children: [
              LogoutButtonField(),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                    ),
                    child: Column(children: [
                      PriceField(),
                      DistanceField(),
                      FoodTypeField(),
                    ])),
              ),
              ApplyButtonField(widget._onPressed),
            ]),
      ),
    );
  }
}
