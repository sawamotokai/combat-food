import 'package:combat_food/screens/preference/pref.dart';
import 'package:combat_food/screens/sign-up/customer-sign-up.dart';
import 'package:flutter/material.dart';
import 'package:combat_food/services/auth.dart';
import 'package:combat_food/screens/swipe/swipe.dart';
import 'package:combat_food/screens/sign-up/customer-sign-up.dart';
import 'package:combat_food/screens/login/login.dart';
import 'package:combat_food/screens/owner/dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          }
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.hasData) {

            // TODO: fetch user and decide which screen to render (dashboard or preference)
            // return Dashboard();
            return Pref();
          }
          // return SwipeScreen();
          return Pref();
          // return const LoginScreen();
        });
  }
}
