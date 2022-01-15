import 'package:flutter/material.dart';
import 'package:combat_food/shared/bottom-nav.dart';

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
