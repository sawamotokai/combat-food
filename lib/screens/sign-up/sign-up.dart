import 'package:combat_food/screens/sign-up/customer-sign-up.dart';
import 'package:combat_food/screens/sign-up/vendor-sign-up.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

enum UserType {
  customer,
  vendor,
}

class _SignUpScreenState extends State<SignUpScreen> {
  int pageIndex = 0;
  UserType _userType = UserType.customer;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    _userType = UserType.customer;
  }

  Widget getBody() {
    return IndexedStack(index: pageIndex, children: [
      Container(
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                title: const Text('Customer'),
                leading: Radio<UserType>(
                  value: UserType.customer,
                  groupValue: _userType,
                  onChanged: (UserType? value) {
                    if (value != null) {
                      setState(() {
                        _userType = value;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('Vendor'),
                leading: Radio<UserType>(
                  value: UserType.vendor,
                  groupValue: _userType,
                  onChanged: (UserType? value) {
                    if (value != null) {
                      setState(() {
                        _userType = value;
                      });
                    }
                  },
                ),
              ),
              ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
            ],
          )),
      CustomerSignUp(),
      VendorSignUp(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: getBody());
  }
}
