import 'package:flutter/material.dart';
import 'package:combat_food/services/auth.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
      ),
      child: const Text("signout", style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),),
      onPressed: () async {
        await AuthService().signOut();
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/',
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
