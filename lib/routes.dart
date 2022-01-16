import 'package:combat_food/screens/about/about.dart';
import 'package:combat_food/screens/login/login.dart';
import 'package:combat_food/screens/sign-up/sign-up.dart';
import 'package:combat_food/screens/profile/profile.dart';
import 'package:combat_food/screens/home/home.dart';
import 'package:combat_food/screens/swipe/swipe.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/sing-up': (context) => const SignUpScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
  '/swipe': (context) => const SwipeScreen()
};
