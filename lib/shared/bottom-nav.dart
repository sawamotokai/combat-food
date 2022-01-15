import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.hamburger, size: 20), label: 'Swipe'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bolt, size: 20), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userCircle, size: 20),
              label: 'Profile'),
        ],
        fixedColor: Colors.deepPurple[200],
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.of(context).pushNamed('/about');
              break;
            case 2:
              Navigator.of(context).pushNamed('/profile');
              break;
          }
        });
  }
}
