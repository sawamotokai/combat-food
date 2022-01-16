import 'package:combat_food/screens/swipe/setting_screen/logout/logout_bottun.dart';
import 'package:flutter/material.dart';

class LogoutButtonField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 250.0),
      child: Container(
        child: LogoutButton(),
      ),
    );
  }
}
