import 'package:flutter/material.dart';
import 'package:combat_food/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ElevatedButton(
          child: const Text("signout"),
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/',
              (Route<dynamic> route) => false,
            );
          },
        ));
  }
}
