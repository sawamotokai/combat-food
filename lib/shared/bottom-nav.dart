import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bolt,
                size: 25,
                color: Colors.black,
              ),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                size: 25,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
          fixedColor: Colors.black,
          backgroundColor: Colors.orangeAccent,
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed('/about');
                break;
              case 1:
                Navigator.of(context).pushNamed('/profile');
                break;
              case 2:
                break;
            }
          }),
    );
  }
}
