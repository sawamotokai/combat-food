import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  String email = "";
  String phoneNumber = "";
  String firstName = "";
  String lastName = "";
  String password = "";
  String confirmPassword = "";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

Widget _buildEmail() {
  return Container();
}

Widget _buildPhoneNumber() {
  return Container();
}

Widget _buildFirstName() {
  return Container();
}

Widget _buildLastName() {
  return Container();
}

Widget _buildPassword() {
  return Container();
}

Widget _buildConfirmationPassword() {
  return Container();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              _buildEmail(),
              _buildPhoneNumber(),
              _buildFirstName(),
              _buildLastName(),
              _buildPassword(),
              _buildConfirmationPassword(),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ));
  }
}
